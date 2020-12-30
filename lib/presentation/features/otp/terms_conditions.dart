import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/routes.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class TermCondition extends StatefulWidget {
  @override
  _TermConditionState createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  @override
  Widget build(BuildContext context) {
    final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
      begin: const BorderRadius.only(
        topRight: Radius.circular(50.0),
      ),
    );
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
                      title: "Terms & Conditions \n",
                      subtitle:
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CheckboxListTile(
                      title: Text(
                        "I agree to the Terms & Conditions",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontFamily: "Lato"),
                      ), // The named parameter 'title' isn't defined.
                      value: true,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity.leading,
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

  _validateAndSend() {
    Navigator.of(context).pushReplacementNamed(SmartShipRoutes.signup);
  }
}
