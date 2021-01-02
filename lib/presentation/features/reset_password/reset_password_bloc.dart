import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:smartshipapp/data/repositories/abstract/user_repository.dart';
import 'package:smartshipapp/presentation/features/reset_password/reset_password.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final UserRepository userRepository;

  ResetPasswordBloc({
    this.userRepository,
  }) : super(ResetPasswordInitial());

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is ResetPasswordPressed) {
      try {
        yield ResetPasswordProcessingState();
        if (event.password.isEmpty) {
          yield ResetPasswordErrorState("Enter new password");
        } else {}
      } catch (error) {
        yield ResetPasswordErrorState(error);
      }
    }
  }
}
