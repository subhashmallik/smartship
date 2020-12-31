import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/sign_in/sign_in_state.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';

import 'sign_in_bloc.dart';
import 'sign_in_event.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController conController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var _key = GlobalKey<ScaffoldState>();
  double sizeBetween;

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );
  final Tween<BorderRadius> _kFrontHeadingBevelRadius1 = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(20.0),
    ),
  );

  Country _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is SignInFinishedState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              SmartShipRoutes.home,
              (Route<dynamic> route) => false,
            );
          }
          // on failure show a snackbar
          if (state is SignInErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                shape: new BeveledRectangleBorder(
                  borderRadius: _kFrontHeadingBevelRadius1.begin,
                ),
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
                    top: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Image.asset(
                                    'assets/images/signin/Gradient2-1.png',
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width *
                                        0.25),
                              ),
                              Container(
                                child: SvgPicture.asset(
                                  'assets/images/logo.svg',
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              'Fast transit &',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            child: Text(
                              'reliable service.',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
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
                        Container(
                          margin: EdgeInsets.all(16),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Please Sign In",
                            style: TextStyle(
                              color: AppColors.appOrange,
                              fontSize: 25,
                              fontFamily: "DIN",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InputField(
                          controller: numberController,
                          label: 'phone number',
                          hint: 'Enter your phone number',
                          prefix: CountryPicker(
                            dense: false,
                            showFlag: true, //displays flag, true by default
                            showDialingCode:
                                true, //displays dialing code, false by default
                            showName:
                                false, //displays country name, true by default
                            showCurrency: false, //eg. 'British pound'
                            showCurrencyISO: false,
                            onChanged: (Country country) {
                              setState(() {
                                _selected = country;
                              });
                            },
                            selectedCountry: _selected,
                          ),
                          suffixWidget:
                              SvgPicture.asset("assets/icons/phone_icon.svg"),
                          formatter: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp(r'\d'))
                          ],
                        ),
                        InputField(
                          controller: passwordController,
                          label: 'Password',
                          hint: 'Enter Password',
                          obscureText: true,
                          suffixWidget: SvgPicture.asset(
                              "assets/icons/password_icon.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            width: double.maxFinite,
                            child: InkWell(
                              child: Text(
                                "Forgot your password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    fontFamily: "Lato"),
                              ),
                              onTap: () => {
                                Navigator.of(context).pushReplacementNamed(
                                    SmartShipRoutes.forgotPassword),
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OpenFlutterButton(
                            title: 'Sign In', onPressed: _validateAndSend),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
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
                                Navigator.of(context).pushReplacementNamed(
                                    SmartShipRoutes.validateUser),
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EN ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
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

  void _validateAndSend() {
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //   SmartShipRoutes.home,
    //   (Route<dynamic> route) => false,
    // );
    //  print("contry ${_selected.dialingCode}");
    if (_selected != null) {
      BlocProvider.of<SignInBloc>(context).add(
        SignInPressed(
          countryCode: _selected.dialingCode,
          phoneNumber: numberController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
    } else {
      SnackBar(
        shape: new BeveledRectangleBorder(
          borderRadius: _kFrontHeadingBevelRadius1.begin,
        ),
        content: Text('${"state.error"}'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      );
    }
  }
}
