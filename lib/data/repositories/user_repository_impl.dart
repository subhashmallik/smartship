import 'package:flutter/material.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/model/app_user.dart';
import 'package:smartshipapp/data/model/registration/Registration.dart';
import 'package:smartshipapp/data/repositories/remote_user_repository.dart';

import 'abstract/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteUserRepository remoteUserRepository;

  UserRepositoryImpl({@required this.remoteUserRepository});

  @override
  Future<AppUser> getUser() async {
    try {
      return remoteUserRepository.getUser();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    @required String email,
  }) async {
    return remoteUserRepository.forgotPassword(email: email);
  }

  @override
  Future<LoginModel> signIn(
      {@required String phoneNumber, @required String password}) async {
    return remoteUserRepository.signIn(
        phoneNumber: phoneNumber, password: password);
  }

  @override
  Future<Registration> signUp(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String password,
      String country}) async {
    return remoteUserRepository.signUp(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        password: password,
        country: country);
  }

  @override
  Future<OTPModel> sendRegistrationOTP(
      {String merchantId, String phoneNumber, String email}) async {
    return remoteUserRepository.sendRegistrationOTP(
        merchantId: merchantId, phoneNumber: phoneNumber, email: email);
  }

  @override
  Future<OTPModel> validateForgotPasswordOTP(
      {String userActivationId, String opt, String merchantID}) async {
    return remoteUserRepository.validateRegistrationOTP(
        userActivationId: userActivationId, opt: opt, merchantID: merchantID);
  }

  @override
  Future<OTPModel> validateRegistrationOTP(
      {String userActivationId, String opt, String merchantID}) async {
    return remoteUserRepository.validateForgotPasswordOTP(
        userActivationId: userActivationId, opt: opt, merchantID: merchantID);
  }

  @override
  Future<ValidateUser> userValidate({String phoneNumber}) async {
    return remoteUserRepository.userValidate(phoneNumber: phoneNumber);
  }
}
