part of 'api_controller_cubit.dart';

abstract class ApiControllerState extends Equatable {
  const ApiControllerState(this.listOfRepositories);

  final List<Repository> listOfRepositories;

  @override
  List<Object> get props => [listOfRepositories];
}

class ApiControllerInitial extends ApiControllerState {
  const ApiControllerInitial(List<Repository> listOfRepositories)
      : super(listOfRepositories);

  @override
  String toString() =>
      'ApiControllerInitial { listOfRepositories: $listOfRepositories}';
}

class ApiControllerWithContent extends ApiControllerState {
  const ApiControllerWithContent(List<Repository> listOfRepositories)
      : super(listOfRepositories);

  @override
  String toString() =>
      'ApiControllerWithContent { listOfRepositories: $listOfRepositories}';

  ApiControllerWithContent copyWith({
    List<Repository>? listOfRepositories,
  }) {
    return ApiControllerWithContent(
      listOfRepositories ?? this.listOfRepositories,
    );
  }
}
