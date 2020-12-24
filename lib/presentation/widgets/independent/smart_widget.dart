import 'package:flutter/material.dart';

class SmartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                alignment: Alignment.topLeft,
                image: new AssetImage(
                  'assets/Create_account_picture.png',
                ),
                // fit: BoxFit.cover,
              ),
            ),
            // child: Image.asset('assets/Gradient.png',
            //   fit: BoxFit.cover,
            //   width: MediaQuery.of(context).size.width,
            // ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            child: Image.asset(
              'assets/Gradient2.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset(
              'assets/SmartShip logo.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
