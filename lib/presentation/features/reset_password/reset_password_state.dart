import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordProcessingState extends ResetPasswordState {}

class ResetPasswordErrorState extends ResetPasswordState {
  final String error;

  ResetPasswordErrorState(this.error);

  @override
  List<Object> get props => [error];
}
