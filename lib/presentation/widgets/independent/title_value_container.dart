import 'package:flutter/material.dart';

class TitleValueContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const TitleValueContainer(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).textTheme.caption.color,
          size: 18,
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                textScaleFactor: 0.7,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
              Text(
                value,
                textScaleFactor: 0.9,
              ),
            ],
          ),
        )
      ],
    );
  }
}
