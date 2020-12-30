import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  @override
  List<Object> get props => [];
}

class OtpInitial extends OtpState {}

class OtpProcessingState extends OtpState {}

class OTPErrorState extends OtpState {
  final String error;

  OTPErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class OTPFinishedState extends OtpState {}
