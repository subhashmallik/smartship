import 'package:smartshipapp/data/model/ErrorDetails.dart';

class CreateUser {
  int code;
  String entity;
  ErrorDetails errorDetails;
  String message;

  CreateUser({this.code, this.entity, this.errorDetails, this.message});

  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      code: json['code'],
      entity: json['entity'],
      errorDetails: json['errorDetails'] != null
          ? ErrorDetails.fromJson(json['errorDetails'])
          : null,
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['entity'] = this.entity;
    data['message'] = this.message;
    if (this.errorDetails != null) {
      data['errorDetails'] = this.errorDetails.toJson();
    }
    return data;
  }
}
