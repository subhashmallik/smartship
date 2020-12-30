import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;
  final String userId;

  LoggedIn(this.token, this.userId);

  @override
  List<Object> get props => [token, userId];
}

class LoggedOut extends AuthenticationEvent {}
