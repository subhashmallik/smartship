import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/shipments/list_shipment.dart';



class ListItemCard extends StatelessWidget {
  String mainImage, Title, subTitle;

  ListItemCard(String image, String title, String subTitle) {
    this.mainImage = image;
    this.Title = title;
    this.subTitle = subTitle;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      margin: EdgeInsets.all(6),
      child: SizedBox(
        child: InkWell(
          onTap:(){ navigateList(context);},
          child: Card(
            color: AppColors.appBlueLight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  mainImage,
                  color: AppColors.appSkyBlueLight,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(Title,style: TextStyle(color: AppColors.appSkyBlueLight),),
                SizedBox(
                  width: 10,
                ),
                Text(subTitle,style: TextStyle(color: AppColors.appSkyBlueLight),),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  "assets/images/next.svg",
                  color: AppColors.appSkyBlueLight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListShipment()));
  }
}
