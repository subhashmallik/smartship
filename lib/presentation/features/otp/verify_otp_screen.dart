import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class VerifyOTP extends StatefulWidget {
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController mobileController = TextEditingController();

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
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
                      title: "OTP Verification",
                      subtitle:
                          "One Time Password (OTP) has been sent to your mobile 9844929876,please enter the same here for verification",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _box(),
                          _box(),
                          _box(),
                          _box(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Text(
                        "",
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
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      child: Text(
                        "Didn't recieve OTP? Resend OTP",
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
      ),
    );
  }

  Widget _box() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      height: 50,
      width: 50,
      color: AppColors.appBlueLightV,
      child: TextField(
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

  _validateAndSend() {
    Navigator.of(context).pushReplacementNamed(SmartShipRoutes.termCondition);
  }
}
