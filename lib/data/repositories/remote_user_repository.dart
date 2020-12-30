import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartshipapp/config/server_addresses.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/model/app_user.dart';
import 'package:smartshipapp/data/model/registration/Registration.dart';

import '../utils.dart';
import 'abstract/user_repository.dart';

class RemoteUserRepository extends UserRepository {
  @override
  Future<LoginModel> signIn({
    @required String phoneNumber,
    @required String password,
  }) async {
    //var route = HttpClient().createUri(ServerAddresses.login);
    var data = <String, String>{
      'MerchantId': ServerAddresses.merchantId,
      'UserName': phoneNumber,
      'MobileNumber': phoneNumber,
      'Password': password,
    };
    String body = json.encode(data);

    var response = await http.post(
        "${ServerAddresses.testServerAddress}/${ServerAddresses.login}",
        headers: {"Content-Type": "application/json"},
        body: body);
    Map jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      throw jsonResponse['message'];
    }
    return LoginModel.fromJson(jsonResponse);
  }

  @override
  Future<Registration> signUp({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String email,
    @required String password,
    @required String country,
  }) async {
    try {
      // var route = HttpClient().createUri(ServerAddresses.userCreate);
      var data = <String, String>{
        'MerchantId': ServerAddresses.merchantId,
        'FirstName': firstName,
        'LastName': lastName,
        'MobileNumber': phoneNumber,
        'EmailId': email,
        'Password': password,
        'Country': country
      };
      String body = json.encode(data);
      List<dynamic> list = [];
      list.add(body);
      var response = await http.post(
          "${ServerAddresses.testServerAddress}/${ServerAddresses.userCreate}",
          headers: {"Content-Type": "application/json"},
          body: list.toString());
      Map jsonResponse = json.decode(response.body);

      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }

      return Registration.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<AppUser> getUser() async {
    try {
      // TODO api call for user information
      await Future.delayed(Duration(seconds: 2));

      return AppUser();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    @required String email,
  }) async {
    try {
      var route = HttpClient().createUri(ServerAddresses.forgotPassword);
      var data = <String, String>{
        'email': email,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<OTPModel> sendRegistrationOTP(
      {String merchantId, String phoneNumber, String email}) async {
    try {
      var route = HttpClient().createUri(ServerAddresses.sendRegistrationOTP);
      var data = <String, String>{
        'Mobile': phoneNumber,
        'MerchantId': merchantId,
        'email': email,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return OTPModel.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<OTPModel> validateForgotPasswordOTP(
      {String userActivationId, String opt, String merchantID}) async {
    try {
      var route =
          HttpClient().createUri(ServerAddresses.validateForgotPasswordOTP);
      var data = <String, String>{
        'UserActivationId': userActivationId,
        'OTP': opt,
        'MerchantId': merchantID,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return OTPModel.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<OTPModel> validateRegistrationOTP(
      {String userActivationId, String opt, String merchantID}) async {
    try {
      var route =
          HttpClient().createUri(ServerAddresses.validateRegistrationOTP);
      var data = <String, String>{
        'UserActivationId': userActivationId,
        'OTP': opt,
        'MerchantId': merchantID,
      };

      var response = await http.post(route, body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return OTPModel.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ValidateUser> userValidate({String phoneNumber}) async {
    var data = <String, String>{
      'MerchantId': ServerAddresses.merchantId,
      'MobileNumber': phoneNumber,
    };
    print("user validate data ${data.toString()}");
    var response = await http.get(
        "${ServerAddresses.testServerAddress}/${ServerAddresses.userValidate}/${ServerAddresses.merchantId}/$phoneNumber");
    Map jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      throw jsonResponse['message'];
    }
    print("user validate res --- ${response.body.toString()}");
    return ValidateUser.fromJson(jsonResponse);
  }
}
