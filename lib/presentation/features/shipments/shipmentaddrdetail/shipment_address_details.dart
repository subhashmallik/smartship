import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/clipped_card.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';

class ShipmentAddressDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select your address",
                    style: TextStyle(color: AppColors.orange),
                  ),
                  SizedBox(
                    width: 150,
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Add New Address",
                            style: TextStyle(
                                fontSize: 11.0, fontFamily: "Raleway"),
                          ),
                          SvgPicture.asset(
                            "assets/images/add_shipment.svg",
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 5),
                            child: ClippedCard(
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Primary Address'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors
                                                    .appOrange),
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/check_green.svg")
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Sabari Karthik',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.white),
                                        ),
                                      ),
                                      Text(
                                        'Building #121, As Sulimaniyah, Khurais Road, Abi Al Arab, Riyadh, Saudi Arabia',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: AppColors.couponHint),
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('0987654321')),
                                      SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Preferred retail centre'
                                              .toUpperCase(),
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColors
                                                  .appAddressSelectColor),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Jayanagar bnaglore karnataka',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 30,
                                              child: RaisedButton(
                                                padding: EdgeInsets.all(3),
                                                color: AppColors.appEditColor,
                                                onPressed: () {},
                                                child: Text('Edit'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Wrap(
                          children: [
                            Container(
                              height: 210,
                              margin: EdgeInsets.only(top: 10, right: 5),
                              child: ClippedCard(
                                bgColor: AppColors.appAddressSelectColor,
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(height: 10),
                                            SvgPicture.asset(
                                              "assets/images/addressbook.svg",
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(height: 10),
                                            Flexible(
                                              child: Text(
                                                'Select from address book',
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: AppColors.white),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '5 Addresses',
                                          style: TextStyle(
                                            color:
                                            AppColors.appCyan,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/arrow_right.svg",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Select the address of \n your customer",
                    style: TextStyle(color: AppColors.orange),
                  ),
                  SizedBox(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Add New Address",
                            style: TextStyle(fontSize: 11.0),
                          ),
                          SvgPicture.asset(
                            "assets/images/add_shipment.svg",
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 5),
                            child: ClippedCard(
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Work Address'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors
                                                    .appOrange),
                                          ),
                                          SvgPicture.asset(
                                              "assets/images/check_green.svg")
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Sabari Karthik',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.white),
                                        ),
                                      ),
                                      Text(
                                        'Building #121, As Sulimaniyah, Khurais Road, Abi Al Arab, Riyadh, Saudi Arabia',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: AppColors.couponHint),
                                      ),
                                      SizedBox(height: 10),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('0987654321')),
                                      SizedBox(height: 10),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Preferred retail centre'
                                                .toUpperCase(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: AppColors
                                                    .appAddressSelectColor),
                                          )),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Jayanagar bnaglore karnataka',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 30,
                                              child: RaisedButton(
                                                padding: EdgeInsets.all(3),
                                                color: AppColors.appEditColor,
                                                onPressed: () {},
                                                child: Text('Edit'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Wrap(
                          children: [
                            Container(
                              height: 210,
                              margin: EdgeInsets.only(top: 10, right: 5),
                              child: ClippedCard(
                                bgColor: AppColors.appAddressSelectColor,
                                child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(height: 10),
                                            SvgPicture.asset(
                                              "assets/images/addressbook.svg",
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(height: 10),
                                            Flexible(
                                              child: Text(
                                                'Select from address book',
                                                overflow: TextOverflow.clip,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    color: AppColors.white),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          '5 Addresses',
                                          style: TextStyle(
                                            color:
                                            AppColors.appCyan,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/images/arrow_right.svg",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              OpenFlutterButton(title: "Proceed to Shipment Details", onPressed: (){},),
            ],
          ),
        ),
      ),
    );
  }

}