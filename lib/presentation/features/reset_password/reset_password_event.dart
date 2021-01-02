import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordPressed extends ResetPasswordEvent {
  final String userActivationId;
  final String password;

  ResetPasswordPressed({
    this.userActivationId,
    this.password,
  });

  @override
  List<Object> get props => [userActivationId];
}
