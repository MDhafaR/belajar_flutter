part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class OnSubmit extends LoginEvent{
  final String username;
  final String password;

  OnSubmit(this.username, this.password);
}

class OnBack extends LoginEvent{}
