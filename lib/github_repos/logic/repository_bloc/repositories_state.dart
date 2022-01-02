part of 'repositories_bloc.dart';

@freezed
class RepositoriesState with _$RepositoriesState {
  const factory RepositoriesState.loading() = _RepositoriesLoading;
  const factory RepositoriesState.content(
    List<Repository> listOfRepositories,
    String searchedPhrase,
    bool hasReachedMax,
  ) = _RepositoriesContent;
  const factory RepositoriesState.error() = _RepositoriesError;
}
