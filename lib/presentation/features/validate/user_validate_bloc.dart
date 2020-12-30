import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';
import 'package:smartshipapp/presentation/features/validate/user_validate.dart';

class UserValidateBloc extends Bloc<UserValidateEvent, UserValidateState> {
  final UserRepository userRepository;

  UserValidateBloc({
    @required this.userRepository,
  }) : super(UserValidateInitial());

  @override
  Stream<UserValidateState> mapEventToState(
    UserValidateEvent event,
  ) async* {
    if (event is UserValidatePressed) {
      yield UserValidateProcessingState();
      try {
        if (event.phoneNumber.isEmpty) {
          yield UserValidateErrorState("Enter Phone Number");
        } else {
          ValidateUser res = await userRepository.userValidate(
            phoneNumber: "${event.countryCode}${event.phoneNumber}",
          );
          if (res.entity) {
            yield UserValidateErrorState(res.message);
          } else {
            yield UserValidateFinishedState();
          }
          // authenticationBloc.add(LoggedIn(res.entity.token, res.entity.userID));
        }
      } catch (error) {
        print("error ==== ${error.toString()}");
        yield UserValidateErrorState(error.toString());
      }
    }
  }
}
