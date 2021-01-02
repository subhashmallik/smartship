import 'package:equatable/equatable.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';

abstract class ForgetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgetPasswordProcessingState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String error;

  ForgetPasswordErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class ForgetPasswordFinishedState extends ForgetPasswordState {
  final SendOTPModel sendOTPModel;

  ForgetPasswordFinishedState(this.sendOTPModel);

  @override
  List<Object> get props => [sendOTPModel];
}
