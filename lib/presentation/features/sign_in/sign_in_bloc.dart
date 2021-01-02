import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/authentication/authentication.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';

import 'sign_in.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  SignInBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(SignInInitialState());
  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    // normal sign in
    if (event is SignInPressed) {
      yield SignInProcessingState();
      try {
        if (event.phoneNumber.isEmpty) {
          yield SignInErrorState("Enter Phone Number");
        } else if (event.password.isEmpty) {
          yield SignInErrorState("Enter Password");
        } else if (event.countryCode.isEmpty) {
          yield SignInErrorState("Select Country code");
        } else {
          LoginModel res = await userRepository.signIn(
            phoneNumber: "${event.countryCode}${event.phoneNumber}",
            password: event.password,
          );
          print("login resp ==== ${res.toString()}");
          if (res.entity != null) {
            authenticationBloc
                .add(LoggedIn(res.entity.token, res.entity.userID));
            yield SignInFinishedState();
          } else {
            yield SignInErrorState(res.errorDetails.message);
          }
        }
      } catch (error) {
        print("error ==== ${error.toString()}");
        yield SignInErrorState(error.toString());
      }
    }
  }
}
