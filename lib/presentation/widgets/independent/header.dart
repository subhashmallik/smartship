import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 150,
      color: AppColors.appBlueDark,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'My Shipments',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: AppColors.appOrange),
            ),
            SvgPicture.asset(
              "assets/images/packages.svg",
              height: 40,
              width: 40,
            )
          ],
        ),
      ),
    );
  }
}
