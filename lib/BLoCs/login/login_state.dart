import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final String firebaseToken;
  const LoginSuccess(this.firebaseToken);
  @override
  List<Object> get props => [firebaseToken];
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);
  @override
  List<Object> get props => [message];
}