import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInPressed extends SignInEvent {
  final String phoneNumber;
  final String password;
  final String countryCode;

  SignInPressed({this.countryCode, this.phoneNumber, this.password});

  @override
  List<Object> get props => [phoneNumber, password];
}
