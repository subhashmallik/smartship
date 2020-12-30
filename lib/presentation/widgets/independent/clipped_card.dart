import 'package:flutter/material.dart';
import 'package:smartshipapp/presentation/widgets/extensions/clippers.dart';


class ClippedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color bgColor;

  const ClippedCard({Key key, this.padding, this.margin, this.child,this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipPath(
        clipper: TopRightClipper(),
        child: Material(
          color: bgColor,
          child: Padding(
            padding: padding ??
                EdgeInsets.only(right: 20, left: 10, bottom: 10, top: 10),
            child: child,
          ),
        ),
      ),
    );
  }
}
