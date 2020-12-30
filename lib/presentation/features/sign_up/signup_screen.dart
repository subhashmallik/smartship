import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_event.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_state.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/dropdown_input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpScreenState();
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fController = TextEditingController();
  final TextEditingController lController = TextEditingController();
  final TextEditingController pController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cController = TextEditingController();

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
  );
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      key: _key,
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
          return SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        alignment: Alignment.topLeft,
                        image: new AssetImage(
                          'assets/images/create_account_picture.png',
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
                              Positioned(
                                child: Container(
                                  child: SvgPicture.asset(
                                    'assets/images/logo.svg',
                                  ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                          decoration: ShapeDecoration(
                            shape: new BeveledRectangleBorder(
                              borderRadius: _kFrontHeadingBevelRadius.begin,
                            ),
                            color: AppColors.appBlueDark,
                          ),
                          child: Column(
                            children: [
                              OpenFlutterTextTile(
                                title: "Create Account",
                                subtitle: "Enter your personal details.",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              InputField(
                                controller: fController,
                                label: 'first name',
                                hint: 'Enter first name',
                                suffixWidget: SvgPicture.asset(
                                    "assets/icons/name_icon.svg"),
                              ),
                              InputField(
                                controller: lController,
                                label: 'last name',
                                hint: 'Enter last name',
                                suffixWidget: SvgPicture.asset(
                                    "assets/icons/name_icon.svg"),
                              ),
                              InputField(
                                controller: pController,
                                label: 'phone number',
                                hint: 'Enter your phone number',
                                suffixWidget: SvgPicture.asset(
                                    "assets/icons/phone_icon.svg"),
                                prefix: Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: SizedBox(
                                    height: 50,
                                    width: 80,
                                    child: FlatButton(
                                      onPressed: _validateAndSend,
                                      child: Row(
                                        children: [
                                          Text(
                                            "+91",
                                            style: TextStyle(
                                                color: AppColors.white),
                                          ),
                                          SizedBox(width: 2),
                                          SvgPicture.asset(
                                              "assets/icons/dropdown_icon.svg"),
                                        ],
                                      ),
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          .color
                                          .withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              ),
                              InputField(
                                controller: emailController,
                                label: 'Email',
                                hint: 'Enter your email',
                                suffixWidget: SvgPicture.asset(
                                    "assets/icons/email_icon.svg"),
                              ),
                              InputField(
                                controller: passwordController,
                                label: 'create your Password',
                                hint: 'create password',
                                suffixWidget: SvgPicture.asset(
                                    "assets/icons/password_icon.svg"),
                              ),
                              DropdownInputField(
                                controller: cController,
                                label: 'COUNTRY',
                                items: ["Select Country", "India", "Arab"],
                                // validator: Validator.valueExists,
                              ),
                              SizedBox(
                                height: sizeBetween,
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
                                height: 250,
                              ),
                            ],
                          ),
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

  void _showSignInScreen() {
    Navigator.of(context).pushNamed(SmartShipRoutes.signin);
  }

  void _validateAndSend() {
    BlocProvider.of<SignUpBloc>(context).add(SignUpPressed(
        fController.text,
        lController.text,
        pController.text,
        emailController.text,
        passwordController.text,
        cController.text));
  }
}
