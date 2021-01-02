import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/config/server_addresses.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';

import 'forget_password.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final UserRepository userRepository;

  ForgetPasswordBloc({@required this.userRepository})
      : super(ForgetPasswordInitialState());

  @override
  Stream<ForgetPasswordState> mapEventToState(
    ForgetPasswordEvent event,
  ) async* {
    if (event is ForgetPasswordPressed) {
      try {
        yield ForgetPasswordProcessingState();
        if (event.email.isEmpty) {
          print("forgot --- ${event.email.isEmpty}");
          yield ForgetPasswordErrorState("Enter phone number or emailid");
        } else {
          SendOTPModel res = await userRepository.sendRegistrationOTP(
              merchantId: ServerAddresses.merchantId,
              phoneNumber: event.email,
              email: event.email);
          if (res.errorDetails == null) {
            yield ForgetPasswordFinishedState(res);
          } else {
            yield ForgetPasswordErrorState(res.errorDetails.additionalProp1);
          }
        }
      } catch (error) {
        yield ForgetPasswordErrorState(error);
      }
    }
  }
}
