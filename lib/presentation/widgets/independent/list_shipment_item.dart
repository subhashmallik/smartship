import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/clipped_card.dart';

import 'confirmation_dialog.dart';


class ListShipmentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClippedCard(
      margin: EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#2320028123 • 25/11/20'),
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (_) => ConfirmationDialog(),
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/images/delete.svg",
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'COSIGNEE NAME',
                        style: TextStyle(
                            color: AppColors.appBlueLight, fontSize: 12),
                      ),
                      Text(
                        'Sabari KARTHIK',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.white, fontSize: 13),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text(
                      'Track Order',
                      style: TextStyle(color: AppColors.appOrange),
                    ),
                    onPressed: () {},
                    color: AppColors.appBlue,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'COSIGNEE City',
                        style: TextStyle(
                            color: AppColors.appBlueLight, fontSize: 12),
                      ),
                      Text(
                        'Bangalore',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: AppColors.white, fontSize: 13),
                      ),
                    ],
                  ),
                  RaisedButton.icon(
                    label: Text(
                      'Print AWB',
                      style: TextStyle(color: AppColors.appOrange),
                    ),
                    onPressed: () {},
                    color: AppColors.appBlue,
                    icon: SvgPicture.asset(
                      "assets/images/printer.svg",
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
  _showDialog(){

  }
}
