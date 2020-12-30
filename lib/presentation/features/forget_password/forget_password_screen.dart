import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

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
  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    alignment: Alignment.topLeft,
                    image: new AssetImage(
                      'assets/images/signin/Login_screen_image2.png',
                    ),
                    // fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(
                  'assets/images/signin/Gradient2-2.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Image.asset(
                                'assets/images/signin/Gradient2-1.png',
                                fit: BoxFit.cover,
                                width:
                                    MediaQuery.of(context).size.width * 0.25),
                          ),
                          Container(
                            child: SvgPicture.asset(
                              'assets/images/logo.svg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, 250.0, 0.0),
                decoration: ShapeDecoration(
                  shape: new BeveledRectangleBorder(
                    borderRadius: _kFrontHeadingBevelRadius.begin,
                  ),
                  color: AppColors.appBlueDark,
                ),
                child: Column(
                  children: [
                    OpenFlutterTextTile(
                      title: "Forgot your password? \n",
                      subtitle:
                          "We will send you a four digit security link to reset your password. This can be done either via SMS or email.",
                    ),
                    InputField(
                      controller: emailController,
                      label: 'phone number/email',
                      hint:
                          'Enter your phone number along with country code/Emailid',
                      suffixWidget:
                          SvgPicture.asset("assets/icons/email_icon.svg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OpenFlutterButton(
                        title: 'Send Code', onPressed: _validateAndSend),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              fontFamily: "Lato"),
                        ),
                        InkWell(
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "DIN"),
                          ),
                          onTap: () => {
                            Navigator.of(context)
                                .pushReplacementNamed(SmartShipRoutes.signin),
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
