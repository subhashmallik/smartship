import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/validate/user_validate.dart';
import 'package:smartshipapp/presentation/features/validate/user_validate_bloc.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class ValidateUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ValidateUserState();
  }
}

class _ValidateUserState extends State<ValidateUser> {
  final TextEditingController numberController = TextEditingController();
  var _key = GlobalKey<ScaffoldState>();
  double sizeBetween;
  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );
  Country _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserValidateBloc, UserValidateState>(
        listener: (context, state) {
          // on success delete navigator stack and push to home
          if (state is UserValidateFinishedState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              SmartShipRoutes.verifyOTP,
              (Route<dynamic> route) => false,
            );
          }
          // on failure show a snackbar
          if (state is UserValidateErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                shape: new BeveledRectangleBorder(
                  borderRadius: _kFrontHeadingBevelRadius.begin,
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
          if (state is UserValidateProcessingState) {
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
                                    width: MediaQuery.of(context).size.width *
                                        0.25),
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
                          title: "Enter Mobile Number",
                          subtitle:
                              "Please enter your phone number so we can check if you are already registered with us.",
                        ),
                        InputField(
                          controller: numberController,
                          label: 'phone number',
                          hint: 'Enter your phone number',
                          suffixWidget:
                              SvgPicture.asset("assets/icons/phone_icon.svg"),
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
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        OpenFlutterButton(
                            title: 'Confirm & Continue',
                            onPressed: _validateAndSend),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account  ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  fontFamily: "Lato"),
                            ),
                            InkWell(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "DIN"),
                              ),
                              onTap: () => {
                                Navigator.of(context).pushReplacementNamed(
                                    SmartShipRoutes.signin),
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
          );
        },
      ),
    );
  }

  void _validateAndSend() {
    print("contry ${_selected.dialingCode}");
    BlocProvider.of<UserValidateBloc>(context).add(UserValidatePressed(
        countryCode: _selected.dialingCode,
        phoneNumber: numberController.text.trim()));
  }
}
