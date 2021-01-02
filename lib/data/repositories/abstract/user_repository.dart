import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartshipapp/data/model/CreateUser.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/model/app_user.dart';
import 'package:smartshipapp/data/model/registration/Registration.dart';

abstract class UserRepository {
  Future<AppUser> getUser();

  Future<LoginModel> signIn({
    @required String phoneNumber,
    @required String password,
  });

  Future<ValidateUser> userValidate({@required String phoneNumber});

  Future<CreateUser> signUp({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String email,
    @required String password,
    @required String country,
  });

  Future<SendOTPModel> sendRegistrationOTP({
    @required String merchantId,
    @required String phoneNumber,
    @required String email,
  });

  Future<OTPModel> validateRegistrationOTP(
      {@required String userActivationId, @required String opt});

  Future<void> forgotPassword({
    @required String email,
  });

  Future<OTPModel> validateForgotPasswordOTP(
      {@required String userActivationId,
      @required String opt,
      @required String merchantID});

  Future<ValidateUser> resetPassword(
      {@required String userActivationId, @required String password});

  Future<Registration> getUserById({@required String userId});

  Future<void> saveDocuments({@required JsonEncoder requestBody});
}
