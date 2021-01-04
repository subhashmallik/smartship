import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/shape_view.dart';
import 'package:smartshipapp/presentation/widgets/independent/text_tile.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(40.0),
    ),
  );
  double sizeBetween;
  @override
  Widget build(BuildContext context) {
    sizeBetween = 20;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.appBlueLightV,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OpenFlutterTextTile(
                title: "Your Wallet ",
                subtitle:
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et",
              ),
              ShapeView(
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Current Balance",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "SAR",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "680",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                80.00,
                AppColors.appBlue,
                AppColors.appBlueLight,
              ),
              SizedBox(
                height: sizeBetween,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    Text(
                      "Past Transactions",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: sizeBetween,
                    ),
                    Text(
                      "November 2020",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.orange,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, position) {
                  return ShapeView(
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Monday • 5/11/20",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.appBlueLight),
                                  ),
                                  SizedBox(
                                    height: sizeBetween,
                                  ),
                                  Text(
                                    "PACKAGE DETAILS",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: AppColors.appBlueLight),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "5KG • ",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.white),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "SAR",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "40 each",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Package Price",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: AppColors.appBlueLight),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "5KG • ",
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: AppColors.white),
                                      ),
                                      Container(
                                        height: 20,
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          "SAR",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: AppColors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "40 each",
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    position.toString(),
                                    style: TextStyle(fontSize: 22.0),
                                  ),
                                  Text(
                                    "Monday • 5/11/20",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.appBlueLight),
                                  ),
                                  Text(
                                    "1.2 km away",
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        color: AppColors.appOrange),
                                  ),
                                  Text(
                                    "Fantasy square, Plots # 1&2, Gachibowli, Near Biodiversity Junction, Gachibowli, 500032",
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: AppColors.appBlueLightV),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      160.0,
                      AppColors.appBlueDark,
                      AppColors.appBlueDark);
                },
              ),
              SizedBox(
                height: sizeBetween,
              ),
              OpenFlutterButton(
                  height: 50,
                  title: 'Confirm & Continue',
                  onPressed: _validateAndSend),
              SizedBox(
                height: sizeBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndSend() {}
}
