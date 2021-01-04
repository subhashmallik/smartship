import 'package:flutter/widgets.dart';

class ShapeView extends StatelessWidget {
  final child;
  final height;
  final Color bgColor;
  final Color fgColor;

  ShapeView(this.child, this.height, this.bgColor, this.fgColor);

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: height,
        decoration: ShapeDecoration(
          shape: new BeveledRectangleBorder(
            borderRadius: _kFrontHeadingBevelRadius.begin,
          ),
          gradient: LinearGradient(
            colors: <Color>[
              bgColor,
              fgColor,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
