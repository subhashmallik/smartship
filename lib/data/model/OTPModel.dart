import 'ErrorDetails.dart';

class OTPModel {
  int code;
  bool entity;
  ErrorDetails errorDetails;
  String message;

  OTPModel({this.code, this.entity, this.errorDetails, this.message});

  factory OTPModel.fromJson(Map<String, dynamic> json) {
    return OTPModel(
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
