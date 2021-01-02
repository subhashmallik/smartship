import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smartshipapp/config/server_addresses.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';

import 'otp_validate.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final UserRepository userRepository;
  OtpBloc({this.userRepository}) : super(OtpInitial());

  @override
  Stream<OtpState> mapEventToState(
    OtpEvent event,
  ) async* {
    if (event is OTPValidatePressed) {
      yield OtpProcessingState();
      try {
        if (event.activationId.isEmpty) {
          yield OTPErrorState("ActivationID Empty");
        } else if (event.otp.isEmpty) {
          yield OTPErrorState("Enter OTP");
        } else {
          OTPModel res = await userRepository.validateRegistrationOTP(
              userActivationId: event.activationId, opt: event.otp);
          print("validate otp res ---- ${res.toString()}");
          if (res.entity) {
            yield OTPFinishedState();
          } else {
            yield OTPErrorState("Invalid OTP");
          }
        }
      } catch (error) {
        print("error ==== ${error.toString()}");
        yield OTPErrorState(error.toString());
      }
    }
    if (event is OTPResendPressed) {
      yield OtpProcessingState();
      try {
        if (event.mobileNumber.isEmpty) {
          yield OTPErrorState("Mobile Number is Empty.");
        } else {
          SendOTPModel res = await userRepository.sendRegistrationOTP(
              merchantId: ServerAddresses.merchantId,
              phoneNumber: event.mobileNumber,
              email: "testemail@tt.com");
          if (res.errorDetails != null) {
            yield OTPFinishedState();
          } else {
            yield OTPErrorState(res.message);
          }
        }
      } catch (error) {
        print("error ==== ${error.toString()}");
        yield OTPErrorState(error.toString());
      }
    }
  }
}
