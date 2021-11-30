import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_repos/github_repos/data/models/repository.dart';

part 'api_controller_state.dart';

class ApiControllerCubit extends Cubit<ApiControllerState> {
  ApiControllerCubit() : super(const ApiControllerInitial([]));
}
