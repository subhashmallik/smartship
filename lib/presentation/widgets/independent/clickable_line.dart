import 'package:flutter/material.dart';
import 'package:smartshipapp/config/theme.dart';

class OpenFlutterClickableLine extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const OpenFlutterClickableLine(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.title,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.sidePadding,
                vertical: AppSizes.linePadding),
            alignment: Alignment.center,
            height: height,
            width: width,
            color: backgroundColor,
            child: Text(title,
                style: _theme.textTheme.display1.copyWith(
                  fontWeight: FontWeight.normal,
                  color: textColor,
                ))));
  }
}
