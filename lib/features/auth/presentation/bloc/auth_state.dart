part of 'auth_bloc.dart';

enum AuthStateStatus{initial, loading, error, success}
extension AuthStateStatusX on AuthStateStatus{
  bool get isInitial => this == AuthStateStatus.initial;
  bool get isLoading => this == AuthStateStatus.loading;
  bool get isError => this == AuthStateStatus.error;
  bool get isSuccess => this == AuthStateStatus.success;
}

class AuthState extends Equatable{
  final AuthStateStatus status;
  final bool loggedOut;
  const AuthState({this.status=AuthStateStatus.initial, required this.loggedOut});
  AuthState copyWith({AuthStateStatus? status, bool? loggedOut}) => AuthState(status: status ?? this.status, loggedOut: loggedOut ?? this.loggedOut);

  @override
  List<Object?> get props => [status, loggedOut];
}
