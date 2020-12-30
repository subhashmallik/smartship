import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartshipapp/config/theme.dart';

//TODO: change to statefull widget
class OpenFlutterCheckbox extends StatelessWidget {
  final double width;
  final String title;
  final bool checked;
  final Function(bool) onTap;

  final mainAxisAlignment;

  const OpenFlutterCheckbox({
    Key key,
    this.width,
    @required this.title,
    this.checked,
    this.onTap,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 50,
        color: checked ? AppColors.appOrange : AppColors.appBundleAddCart,
        child: InkWell(
            onTap: (() => {onTap(!checked)}),
            child: Row(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                Visibility(
                  visible: checked,
                  child: CircularCheckBox(
                      value: checked,
                      checkColor: AppColors.white,
                      activeColor: AppColors.green,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      onChanged: (bool x) {}),
                ),
              ],
            )));
  }
}
