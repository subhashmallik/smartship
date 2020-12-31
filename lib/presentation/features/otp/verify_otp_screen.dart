import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/otp/otp_bloc.dart';
import 'package:smartshipapp/presentation/features/otp/otp_validate.dart';
import 'package:smartshipapp/presentation/features/validate/validate_user_screen.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

import 'otp_bloc.dart';

class VerifyOTP extends StatefulWidget {
  final mobileNumber;
  const VerifyOTP({Key key, this.mobileNumber}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController controller_a = TextEditingController();
  final TextEditingController controller_b = TextEditingController();
  final TextEditingController controller_c = TextEditingController();
  final TextEditingController controller_d = TextEditingController();

  int _seconds = 300;
  Timer _timer;
  String userActivationId;
  String otp;

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );
  @override
  void initState() {
    _resetTimer();
    super.initState();
  }

  _resetTimer() {
    _seconds = 300;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_seconds <= 0) {
        timer.cancel();
      }
      setState(() {
        _seconds -= 1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //OTPArguments args = ModalRoute.of(context).settings.arguments;
    final OTPArguments args = ModalRoute.of(context).settings.arguments;
    userActivationId = args.userActivationId;
    //  print("number --- $args");
    return Scaffold(
      body: BlocConsumer<OtpBloc, OtpState>(
        listener: (context, state) {
          if (state is OTPFinishedState) {
            Navigator.of(context)
                .pushReplacementNamed(SmartShipRoutes.termCondition);
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   SmartShipRoutes.verifyOTP,
            //   (Route<dynamic> route) => false,
            // );
          }
          if (state is OTPErrorState) {
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
          if (state is OtpProcessingState) {
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
                          title: "OTP Verification",
                          subtitle:
                              "One Time Password (OTP) has been sent to your mobile ${args.number}., please enter the same here for verification",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _box(controller_a),
                              _box(controller_b),
                              _box(controller_c),
                              _box(controller_d),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                "OTP expires in :",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "${_formatSecond(_seconds)}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Text(
                            "Didn't receive OTP? Resend OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "DIN"),
                          ),
                          onTap: () => {_resendAndSend(args.number)},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OpenFlutterButton(
                            title: 'Verify OTP', onPressed: _validateAndSend),
                        SizedBox(
                          height: 20,
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

  Widget _box(TextEditingController con) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 50,
      width: 50,
      color: AppColors.appBlueLightV,
      child: TextField(
        controller: con,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.white,
        ),
        decoration: InputDecoration(border: InputBorder.none, counterText: ''),
      ),
    );
  }

  _formatSecond(int second) {
    int min = 0;
    int sec = second;
    if (_seconds >= 60) {
      min = second ~/ 60;
      sec = second % 60;
    }
    return sec < 10 ? "0$min:0$sec" : "0$min:$sec";
  }

  _validateAndSend() {
    otp =
        "${controller_a.text}${controller_b.text}${controller_c.text}${controller_d.text}";
    print("otp --- $otp");
    BlocProvider.of<OtpBloc>(context)
        .add(OTPValidatePressed(activationId: userActivationId, otp: otp));
  }

  _resendAndSend(String num) {
    BlocProvider.of<OtpBloc>(context).add(OTPResendPressed(mobileNumber: num));
  }
}
