import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/authentication/authentication_bloc.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';

import 'sign_up.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(SignUpInitialState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // normal sign up
    if (event is SignUpPressed) {
      yield SignUpProcessingState();
      try {
        final token = await userRepository.signUp(
            firstName: event.firstName,
            lastName: event.lastName,
            phoneNumber: event.phoneNumber,
            email: event.email,
            password: event.password,
            country: event.country);
        // authenticationBloc.add(LoggedIn(token));
        yield SignUpFinishedState();
      } catch (error) {
        print("error $error");
        yield SignUpErrorState(error);
      }
    }
  }
}
