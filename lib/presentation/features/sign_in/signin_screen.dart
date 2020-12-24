import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/sign_in/sign_in_state.dart';
import 'package:smartshipapp/presentation/widgets/widgets.dart';

import 'sign_in_bloc.dart';
import 'sign_in_event.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is SignInFinishedState) {
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   SmartShipRoutes.home,
            //   (Route<dynamic> route) => false,
            // );
          }
          // on failure show a snackbar
          if (state is SignInErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          // show loading screen while processing
          if (state is SignInProcessingState) {
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
                  InputField(
                    controller: emailController,
                    label: 'Email',
                  ),
                  InputField(
                    controller: passwordController,
                    label: 'Password',
                  ),
                  OpenFlutterButton(
                      title: 'LOGIN', onPressed: _validateAndSend),
                  SizedBox(
                    height: sizeBetween * 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                    child: Center(
                      child: Text('Or sign up with social account'),
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

  void _showForgotPassword() {
    Navigator.of(context).pushNamed(SmartShipRoutes.forgotPassword);
  }

  void _validateAndSend() {
    BlocProvider.of<SignInBloc>(context).add(
      SignInPressed(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}

class Validator {}
