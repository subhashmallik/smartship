import 'package:equatable/equatable.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';

abstract class UserValidateState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserValidateInitial extends UserValidateState {}

class UserValidateProcessingState extends UserValidateState {}

class UserValidateErrorState extends UserValidateState {
  final String error;

  UserValidateErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class UserValidateFinishedState extends UserValidateState {
  final SendOTPModel res;

  UserValidateFinishedState(this.res);
  @override
  List<Object> get props => [res];
}

class SendOTPState extends UserValidateState {}
