import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckingAccount extends StatefulWidget {
  @override
  _CheckingAccountState createState() => _CheckingAccountState();
}

class _CheckingAccountState extends State<CheckingAccount> {
  final TextEditingController mobileController = TextEditingController();

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(20.0),
    ),
    end: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: new BoxDecoration(
        //   image: new DecorationImage(
        //     alignment: Alignment.topLeft,
        //     image: new AssetImage('assets/Gradient2-2.png',),
        //     // fit: BoxFit.cover,
        //   ),
        // ),
        child: Stack(
          children: [
            Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  alignment: Alignment.topLeft,
                  image: new AssetImage(
                    'assets/images/Login_screen_image2.png',
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Image.asset(
                'assets/images/Gradient2-2.png',
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
                          child: Image.asset('assets/images/Gradient2-1.png',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.25),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/images/SmartShip_Logo2.png',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4),
              child: PhysicalShape(
                color: Color(0xFF112B50),
                clipper: new ShapeBorderClipper(
                    shape: new BeveledRectangleBorder(
                  borderRadius: _kFrontHeadingBevelRadius.begin,
                )),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Checking for your account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30, top: 10),
                          child: Text(
                            'Please wait while we check our database',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 75, top: 10),
                          child: Text(
                            'if you are registered with us.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/searching.png',
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50, top: 35),
                              child: Container(
                                child: Image.asset(
                                  'assets/images/loading.png',
                                  height: 60,
                                  // width: MediaQuery.of(context).size.width * 0.60,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(),
                              Center(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
