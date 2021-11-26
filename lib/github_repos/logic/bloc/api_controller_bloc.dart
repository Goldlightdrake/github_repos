import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

part 'api_controller_event.dart';
part 'api_controller_state.dart';

class ApiControllerBloc extends Bloc<ApiControllerEvent, ApiControllerState> {
  ApiControllerBloc() : super(ApiControllerInitial()) {
    on<ApiControllerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );
}
