part of 'repositories_bloc.dart';

@freezed
class RepositoriesEvent with _$RepositoriesEvent {
  const factory RepositoriesEvent.refreshRepositories() = _refreshRepositories;
  const factory RepositoriesEvent.loadRepositories() = _loadRepositories;
  const factory RepositoriesEvent.searchForRepository(String searchedPhrase) =
      _searchForRepository;
}
