import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_event.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_state.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  var _key = GlobalKey<ScaffoldState>();
  static const _PANEL_HEADER_HEIGHT = 32.0;
  static const double _kFrontHeadingHeight = 100.0;
  double sizeBetween;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
    end: const BorderRadius.only(
      topRight: Radius.circular(_kFrontHeadingHeight),
    ),
  );
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
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is SignUpFinishedState) {
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   SmartShipRoutes.home,
            //   (Route<dynamic> route) => false,
            // );
          }
          // on failure show a snackbar
          if (state is SignUpErrorState) {
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
          if (state is SignUpProcessingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return PhysicalShape(
            color: AppColors.appBlueDark,
            clipper: new ShapeBorderClipper(
                shape: new BeveledRectangleBorder(
              borderRadius: _kFrontHeadingBevelRadius.begin,
            )),
            child: SingleChildScrollView(
              child: Container(
                height: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    OpenFlutterTextTile(
                      title: "Create Account",
                      subtitle: "Enter your personal details.",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InputField(
                      controller: nameController,
                      label: 'first name',
                      hint: 'Enter first name',
                      // validator: Validator.valueExists,
                    ),
                    InputField(
                      controller: nameController,
                      label: 'last name',
                      hint: 'Enter last name',
                      // validator: Validator.valueExists,
                    ),
                    InputField(
                      controller: nameController,
                      label: 'phone number',
                      hint: 'Enter your phone number',
                      // validator: Validator.valueExists,
                    ),
                    InputField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                    ),
                    InputField(
                      controller: passwordController,
                      label: 'create your Password',
                      hint: 'create password',
                      //  validator: Validator.passwordCorrect,
                    ),
                    InputField(
                      controller: nameController,
                      label: 'Country',
                      // validator: Validator.valueExists,
                    ),
                    OpenFlutterButton(
                        title: 'SIGN UP', onPressed: _validateAndSend),
                    SizedBox(
                      height: sizeBetween,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSignInScreen() {
    Navigator.of(context).pushNamed(SmartShipRoutes.signin);
  }

  void _validateAndSend() {
    BlocProvider.of<SignUpBloc>(context).add(
      SignUpPressed(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
