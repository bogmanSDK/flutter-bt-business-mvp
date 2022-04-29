part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class Initial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginUserSuccess extends AuthState {
  final String resTest;

  LoginUserSuccess(this.resTest,);
  @override
  List<Object> get props => [resTest];
}

class LoginUserError extends AuthState {
  @override
  List<Object> get props => [];
}