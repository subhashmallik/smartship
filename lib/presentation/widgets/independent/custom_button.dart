import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';

class OpenFlutterButton extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final String title;
  final IconData icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  OpenFlutterButton({
    Key key,
    this.width,
    this.height,
    @required this.title,
    @required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
      begin: const BorderRadius.only(
        topRight: Radius.circular(10.0),
      ),
    );
    return new GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: height,
          decoration: ShapeDecoration(
            shape: new BeveledRectangleBorder(
              borderRadius: _kFrontHeadingBevelRadius.begin,
            ),
            gradient: LinearGradient(
              colors: <Color>[
                AppColors.appOrange,
                AppColors.appRed,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SvgPicture.asset("assets/icons/right_arrow_icon.svg"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
