import 'package:flutter/material.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/model/app_user.dart';
import 'package:smartshipapp/data/model/registration/Registration.dart';

abstract class UserRepository {
  Future<LoginModel> signIn({
    @required String phoneNumber,
    @required String password,
  });

  Future<ValidateUser> userValidate({@required String phoneNumber});

  Future<Registration> signUp({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String email,
    @required String password,
    @required String country,
  });

  Future<OTPModel> sendRegistrationOTP({
    @required String merchantId,
    @required String phoneNumber,
    @required String email,
  });

  Future<OTPModel> validateRegistrationOTP(
      {@required String userActivationId,
      @required String opt,
      @required String merchantID});

  /// Get the user information and return it as [AppUser]
  Future<AppUser> getUser();

  /// Send to [email] a user forget email
  Future<void> forgotPassword({
    @required String email,
  });

  Future<OTPModel> validateForgotPasswordOTP(
      {@required String userActivationId,
      @required String opt,
      @required String merchantID});
}
