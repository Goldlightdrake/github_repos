import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/github_repos/logic/repository_bloc/repositories_bloc.dart';
import 'package:github_repos/github_repos/view/main_screen/widgets/header.dart';
import 'package:github_repos/github_repos/view/main_screen/widgets/repository_list_tile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget viewFromState = Container();
    context
        .read<RepositoriesBloc>()
        .add(const RepositoriesEvent.loadRepositories());
    return Column(
      children: [
        const Header(),
        BlocBuilder<RepositoriesBloc, RepositoriesState>(
          builder: (BuildContext context, state) {
            state.when(
              loading: () {
                viewFromState = const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              content: (listOfRepositories, searched, hasReachedMax) {
                if (listOfRepositories.isEmpty) {
                  viewFromState = Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'There is no repositories to show!',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(Icons.error),
                      ],
                    ),
                  );
                } else {
                  viewFromState = Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: hasReachedMax
                          ? listOfRepositories.length
                          : listOfRepositories.length + 1,
                      itemBuilder: (context, index) => index >=
                              listOfRepositories.length
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                            )
                          : RepositoryListTile(
                              listOfRepositories[index],
                              key: UniqueKey(),
                            ),
                    ),
                  );
                }
              },
              error: () {
                viewFromState = Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      'Something went wrong',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                );
              },
            );
            return viewFromState;
          },
        )
      ],
    );
  }

  void _onScroll() {
    if (_isBottom) {
      final state = context.read<RepositoriesBloc>().state;
      // ignore: cascade_invocations
      state.maybeWhen(
        content: (listOfRepositories, searchedPhrase, hasReachedMax) {
          if (searchedPhrase.isNotEmpty) {
            context.read<RepositoriesBloc>().add(
                  RepositoriesEvent.searchForRepository(searchedPhrase),
                );
          } else {
            context
                .read<RepositoriesBloc>()
                .add(const RepositoriesEvent.loadRepositories());
          }
        },
        orElse: () => null,
      );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
