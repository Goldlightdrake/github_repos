import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos/github_repos/logic/repository_bloc/repositories_bloc.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff2d333b),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GitHub Repos',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              const Image(
                image: AssetImage('assets/github_logo.png'),
                width: 40,
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            style: const TextStyle(color: Colors.white),
            controller: textFieldController,
            cursorColor: Colors.white,
            cursorWidth: 1,
            onSubmitted: (event) {
              if (textFieldController.text.isNotEmpty) {
                context
                    .read<RepositoriesBloc>()
                    .add(const RepositoriesEvent.refreshRepositories());
                context.read<RepositoriesBloc>().add(
                      RepositoriesEvent.searchForRepository(
                        textFieldController.text,
                      ),
                    );
              } else {
                context
                    .read<RepositoriesBloc>()
                    .add(const RepositoriesEvent.refreshRepositories());
                context
                    .read<RepositoriesBloc>()
                    .add(const RepositoriesEvent.loadRepositories());
              }
            },
            decoration: const InputDecoration(
              hintText: 'Search or jump to...',
              // hintStyle: TextStyle(color: )
              // TODO: implement changing color on hovering to 0xff59605a
            ),
          ),
        ],
      ),
    );
  }
}
