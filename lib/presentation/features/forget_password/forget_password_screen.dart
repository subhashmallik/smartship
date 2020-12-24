import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/service_button.dart';

import 'forget_password.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  var _key = GlobalKey<ScaffoldState>();
  double sizeBetween;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.background,
      body: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          // on success push back
          if (state is ForgetPasswordFinishedState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'An email with password reminder was sent to ${state.email}'),
                backgroundColor: Colors.green, // TODO use app colors
                duration: Duration(seconds: 3),
              ),
            );
          }
          // on failure show a snackbar
          if (state is ForgetPasswordErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red, // TODO use app colors
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          // show loading screen while processing
          if (state is ForgetPasswordProcessingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Container(
              height: height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: sizeBetween,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Text(
                        'Please enter your email address. You will receive a link to create a new password via email'),
                  ),
                  InputField(
                    controller: emailController,
                    hint: 'Email',
                    //  validator: Validator.validateEmail,
                  ),
                  OpenFlutterButton(title: 'SEND', onPressed: _validateAndSend),
                  SizedBox(
                    height: sizeBetween * 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                    child: Center(
                      child: Text('Or sign up with social account'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        OpenFlutterServiceButton(
                          serviceType: ServiceType.Google,
                          onPressed: () {},
                        ),
                        OpenFlutterServiceButton(
                          serviceType: ServiceType.Facebook,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSignUpScreen() {
    Navigator.of(context).pushNamed(SmartShipRoutes.signup);
  }

  void _validateAndSend() {
    BlocProvider.of<ForgetPasswordBloc>(context).add(
      ForgetPasswordPressed(
        emailController.text,
      ),
    );
  }
}
