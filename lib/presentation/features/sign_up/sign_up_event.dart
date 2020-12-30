import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpPressed extends SignUpEvent {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String password;
  final String country;

  SignUpPressed(this.firstName, this.lastName, this.phoneNumber, this.email,
      this.password, this.country);

  @override
  List<Object> get props => [phoneNumber, password];
}
