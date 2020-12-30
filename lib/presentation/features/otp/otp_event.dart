import 'package:equatable/equatable.dart';

abstract class OtpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OTPValidatePressed extends OtpEvent {
  final String activationId;
  final String otp;

  OTPValidatePressed({this.activationId, this.otp});

  @override
  List<Object> get props => [activationId];
}

class OTPResendPressed extends OtpEvent {
  final String mobileNumber;

  OTPResendPressed({
    this.mobileNumber,
  });

  @override
  List<Object> get props => [mobileNumber];
}
