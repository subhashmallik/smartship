import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/routes.dart';

class Splash extends StatefulWidget {
  final String slug;

  const Splash({Key key, this.slug}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _navigate() async {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.of(context).pushReplacementNamed(SmartShipRoutes.signin);
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
          Image(
            image: new AssetImage(
              'assets/images/splash/splash_image.png',
            ),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Image(
            image: new AssetImage(
              'assets/images/splash/gradient.png',
            ),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.20,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
        ],
      ),
    );
  }
}
