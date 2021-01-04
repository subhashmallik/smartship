import 'package:smartshipapp/data/model/Entity.dart';
import 'package:smartshipapp/data/model/ErrorDetails.dart';

class LoginModel {
  int code;
  Entity entity;
  ErrorDetails errorDetails;
  String message;

  LoginModel({this.code, this.entity, this.errorDetails, this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      code: json['code'],
      entity: json['entity'] != null ? Entity.fromJson(json['entity']) : null,
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'])
          : null,
      message: json['Message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['Message'] = this.message;
    if (this.entity != null) {
      data['entity'] = this.entity.toJson();
    }
    if (this.errorDetails != null) {
      data['errorDetails'] = this.errorDetails.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'LoginModel{code: $code, entity: $entity, errorDetails: $errorDetails, message: $message}';
  }
}
