part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent{
  final BuildContext context;
  final String email;
  final String password;
  const RegisterEvent(this.context, {required this.email, required this.password});
}

class LoginEvent extends AuthEvent{
  final BuildContext context;
  final String email;
  final String password;
  const LoginEvent(this.context, {required this.email, required this.password});
}

class LogoutEvent extends AuthEvent{
  const LogoutEvent();
}