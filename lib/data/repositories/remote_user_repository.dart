import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smartshipapp/config/server_addresses.dart';
import 'package:smartshipapp/data/model/CreateUser.dart';
import 'package:smartshipapp/data/model/LoginModel.dart';
import 'package:smartshipapp/data/model/OTPModel.dart';
import 'package:smartshipapp/data/model/SendOTPModel.dart';
import 'package:smartshipapp/data/model/ValidateUser.dart';
import 'package:smartshipapp/data/model/app_user.dart';

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
  Future<ValidateUser> userValidate({String phoneNumber}) async {
    var data = <String, String>{
      'MerchantId': ServerAddresses.merchantId,
      'MobileNumber': phoneNumber,
    };
    var response = await http.get(
        "${ServerAddresses.testServerAddress}/${ServerAddresses.userValidate}/${ServerAddresses.merchantId}/$phoneNumber");
    Map jsonResponse = json.decode(response.body);
    if (response.statusCode != 200) {
      throw jsonResponse['message'];
    }
    print("user validate res --- ${response.body.toString()}");
    return ValidateUser.fromJson(jsonResponse);
  }

  @override
  Future<CreateUser> signUp({
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
      var user = {
        "MerchantId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "UserID": "00000000-0000-0000-0000-000000000000",
        "UserInfoId": 0,
        "MobileNumber": phoneNumber,
        "MobileNumberCode": "91",
        "Password": password,
        "FirstName": firstName,
        "LastName": lastName,
        "Address1": "",
        "Address2": "",
        "Landmark": "",
        "City": null,
        "CityName": "",
        "State": "",
        "StateName": "",
        "Country": "in",
        "CountryName": "",
        "ZipCode": "122001",
        "Lattitude": 28.4594993591309,
        "Longitude": 77.0266036987305,
        "EmailId": email,
        "IsEmailVerifed": false,
        "IsPhoneVerified": false,
        "IsTNCAccepted": false,
        "ApprovalStatus": "",
        "ApprovalDateTime": "0001-01-01T00:00:00",
        "PrefferedLanguage": "EN",
        "IsActive": false,
        "Status": "",
        "CompanyId": 999,
        "CompanyInfo": null,
        "BankDetail": null,
        "Documents": null,
        "RetailCenterModel": null,
        "IsRegistrationOTPVerified": false,
        "gender": 0,
        "AllowPushNotifications": false,
        "AllowLocationAccess": false,
        "DateOfBirth": "0001-01-01T00:00:00",
        "comment": null,
      };
      List<Map> dataList = new List();
      dataList.add(user);
      var jsonData = jsonEncode(dataList);

      //print("create user json  ${user.toString()}");
      var response = await http.post(
          "${ServerAddresses.testServerAddress}/${ServerAddresses.userCreate}",
          headers: {"Content-Type": "application/json"},
          body: jsonData);
      print("create user --- ${response.body.toString()}");
      Map jsonResponse = json.decode(response.body);

      if (response.statusCode != 200) {
        print("create user --- ${jsonResponse['message']}");
        //throw jsonResponse['message'];
      }

      return CreateUser.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({
    @required String email,
  }) async {
    try {
      // var route = HttpClient().createUri(ServerAddresses.forgotPassword);
      var data = <String, String>{
        'email': email,
      };

      var response = await http.post("{}", body: data);
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SendOTPModel> sendRegistrationOTP(
      {String merchantId, String phoneNumber, String email}) async {
    try {
      print(
          "otp url ----- ${ServerAddresses.testServerAddress}${ServerAddresses.sendRegistrationOTP}${ServerAddresses.merchantId}/$phoneNumber/$email");
      var response = await http.get(
          "${ServerAddresses.testServerAddress}${ServerAddresses.sendRegistrationOTP}${ServerAddresses.merchantId}/$phoneNumber/$email");
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return SendOTPModel.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<OTPModel> validateForgotPasswordOTP(
      {String userActivationId, String opt, String merchantID}) async {
    try {
      var response = await http.get(
          "${ServerAddresses.testServerAddress}/${ServerAddresses.validateForgotPasswordOTP}/$merchantID/$userActivationId/$opt");
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
  Future<OTPModel> validateRegistrationOTP(
      {String userActivationId, String opt}) async {
    try {
      print("validate otp ---- $userActivationId ==  $opt");
      var response = await http.get(
          "${ServerAddresses.testServerAddress}/${ServerAddresses.validateRegistrationOTP}/${ServerAddresses.merchantId}/$userActivationId/$opt");
      Map jsonResponse = json.decode(response.body);
      if (response.statusCode != 200) {
        throw jsonResponse['message'];
      }
      return OTPModel.fromJson(jsonResponse);
    } catch (error) {
      rethrow;
    }
  }
}
