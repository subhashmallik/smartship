import 'package:flutter/material.dart';
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
    this.backgroundColor = AppColors.red,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.red,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    EdgeInsetsGeometry edgeInsets = EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
    const double _kFrontHeadingHeight = 50.0;
    final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
      begin: const BorderRadius.only(
        topRight: Radius.circular(10.0),
      ),
      end: const BorderRadius.only(
        topRight: Radius.circular(_kFrontHeadingHeight),
      ),
    );
    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        child: PhysicalShape(
          color: AppColors.appBlueLightV,
          clipper: new ShapeBorderClipper(
              shape: new BeveledRectangleBorder(
            borderRadius: _kFrontHeadingBevelRadius.begin,
          )),
          child: Container(
            width: width,
            height: height,
            padding: edgeInsets,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    0.8, 0.0), // 10% of the width, so there are ten blinds.
                colors: [
                  const Color(0xffee0000),
                  const Color(0xffeeee00)
                ], // red to yellow
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _buildIcon(_theme),
                  _buildTitle(_theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    /*RaisedButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(
          AppSizes.buttonRadius
        )
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: Text(title,
          style: _theme.textTheme.button.copyWith(
            backgroundColor: _theme.textTheme.button.backgroundColor,
            color: _theme.textTheme.button.color
          )
        )
      )
    );*/
  }

  Widget _buildTitle(ThemeData _theme) {
    return Text(
      title,
      style: _theme.textTheme.button.copyWith(
        backgroundColor: _theme.textTheme.button.backgroundColor,
        color: textColor,
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: theme.textTheme.button.color,
        ),
      );
    }

    return SizedBox();
  }
}
