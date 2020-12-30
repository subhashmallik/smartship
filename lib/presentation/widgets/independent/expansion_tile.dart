import 'package:flutter/material.dart';
import 'package:smartshipapp/config/theme.dart';

class OpenFlutterExpansionTile extends StatefulWidget {
  final String title, description;
  final Widget leading, trailing;
  final List<Widget> children;

  const OpenFlutterExpansionTile({
    @required this.title,
    @required this.description,
    @required this.leading,
    @required this.trailing,
    @required this.children,
  });

  @override
  State createState() => OpenFlutterExpansionTileState();
}

class OpenFlutterExpansionTileState extends State<OpenFlutterExpansionTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.appDarkBlue,
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: ExpansionTile(
        title: Text(
          widget.title,
          style: TextStyle(color: AppColors.white),
        ),
        subtitle: Text(
          widget.description,
          style: TextStyle(color: AppColors.white),
        ),
        onExpansionChanged: (bool expanding) => setState(() {
          this.isExpanded = expanding;
          print("expent $isExpanded");
        }),
        leading: widget.leading,
        trailing: this.isExpanded
            ? Icon(
                Icons.expand_less,
                color: AppColors.white,
              )
            : widget.trailing,
        backgroundColor: AppColors.appDarkBlue,
        children: widget.children,
      ),
    );
  }
}
