import 'package:equatable/equatable.dart';

abstract class UserValidateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserValidatePressed extends UserValidateEvent {
  final String phoneNumber;
  final String countryCode;

  UserValidatePressed({this.countryCode, this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}

class SendOTP extends UserValidateEvent {
  final String phoneNumber;
  final String countryCode;

  SendOTP({this.countryCode, this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
