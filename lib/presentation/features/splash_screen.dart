import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/routes.dart';

class Splash extends StatefulWidget {
  final String slug;

  const Splash({Key key, this.slug}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final String smsa = 'assets/images/smsa.svg';
  final String smsaLogo = 'assets/images/smsa_logo.svg';

  _navigate() async {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacementNamed(SmartShipRoutes.signup);
    });
  }

  @override
  void initState() {
    _navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/splash_bg1.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SvgPicture.asset(
            "assets/images/smart_ship_logo.svg",
            color: Colors.transparent,
            width: 357,
            height: 100,
          )
        ],
      ),
    );
  }
}
