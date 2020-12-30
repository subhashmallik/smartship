import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final EdgeInsets margin;
  final Color color;

  const   SectionTitle(this.text, {Key key, this.margin, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        "$text".toUpperCase(),
        style: TextStyle(
          color: color ?? Theme.of(context).accentColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
