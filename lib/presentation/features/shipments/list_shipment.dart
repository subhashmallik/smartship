import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/header.dart';
import 'package:smartshipapp/presentation/widgets/independent/list_shipment_item.dart';


class ListShipment extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: AppColors.appBlueDark,
        child: Column(
          children: [
            Header(),
            ListShipmentItem(),
            ListShipmentItem(),
          ],
        ),
      ),
    );
  }

}
