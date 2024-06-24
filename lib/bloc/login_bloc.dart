import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is OnSubmit) {
        emit(LoginLoading());
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginSuccess(event.username, event.password));
      }
      if (event is OnBack) {
        emit(LoginInitial());
      }
    });
  }
}
