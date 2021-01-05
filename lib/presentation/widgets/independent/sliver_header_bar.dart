import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/theme.dart';

class SliverHeaderBar extends StatefulWidget {
  String title;

  SliverHeaderBar(String title) {
    this.title = title;
  }

  @override
  _SliverHeaderBarState createState() => _SliverHeaderBarState();
}

class _SliverHeaderBarState extends State<SliverHeaderBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      backgroundColor: AppColors.appBlue,
      expandedHeight: 170,
      automaticallyImplyLeading: false,
      pinned: true,
      primary: true,
      elevation: 0,
      bottom: PreferredSize(
        child: Container(),
        preferredSize: Size.fromHeight(56),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(bottom: 45),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(7),
            ),
            Expanded(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
        background: Align(
          alignment: Alignment(1.3, 0.52),
          child: Container(
            child: SvgPicture.asset(
              "assets/images/head_icon_load.svg",
              color: AppColors.appBlueLight,
              width: 120,
              height: 120,
            ),
          ),
        ),
      ),
    );
  }
}
