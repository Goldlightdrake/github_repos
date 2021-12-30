import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repos/github_repos/data/data_repository.dart';
import 'package:github_repos/github_repos/data/models/models.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';
part 'repositories_bloc.freezed.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  RepositoriesBloc({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const _RepositoriesLoading()) {
    on<_loadRepositories>(_onLoadRepositories);
    on<_searchForRepository>(_onSearchRepositories);
    on<_refreshRepositories>(
      (event, emit) => emit(const RepositoriesState.loading()),
    );
  }

  final DataRepository _dataRepository;

  Future<void> _onLoadRepositories(
    _loadRepositories event,
    Emitter<RepositoriesState> emit,
  ) async {
    var emittedState = const RepositoriesState.error();
    await state.when(
      loading: () async {
        final listOfRepositories = await _dataRepository.fetchRepositories();
        emittedState = RepositoriesState.content(listOfRepositories, '');
      },
      content:
          (List<Repository> listOfRepositories, String searchedPhrase) async {
        final newListOfRepositories = await _dataRepository.fetchRepositories(
          since: listOfRepositories[listOfRepositories.length - 1].id,
        );
        emittedState = RepositoriesState.content(
          List.of(listOfRepositories)..addAll(newListOfRepositories),
          searchedPhrase,
        );
      },
      error: () {
        emittedState = const RepositoriesState.error();
      },
    );
    return emit.call(emittedState);
  }

  Future<void> _onSearchRepositories(
    _searchForRepository event,
    Emitter<RepositoriesState> emit,
  ) async {
    var emittedState = const RepositoriesState.error();
    await state.when(
      loading: () async {
        final listOfRepositories = await _dataRepository
            .fetchSearchedRepositories(event.searchedPhrase);
        emittedState =
            RepositoriesState.content(listOfRepositories, event.searchedPhrase);
      },
      content:
          (List<Repository> listOfRepositories, String searchedPhrase) async {
        final newListOfRepositories =
            await _dataRepository.fetchSearchedRepositories(
          event.searchedPhrase,
          page: (listOfRepositories.length / 30).round() + 2,
        );
        emittedState = RepositoriesState.content(
          List.of(listOfRepositories)..addAll(newListOfRepositories),
          searchedPhrase,
        );
      },
      error: () {
        emittedState = const RepositoriesState.error();
      },
    );
    return emit.call(emittedState);
  }
}
