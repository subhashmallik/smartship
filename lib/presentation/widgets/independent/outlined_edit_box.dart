import 'package:flutter/material.dart';
import 'package:smartshipapp/config/theme.dart';

class OutLinedEditBox extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final FormFieldValidator validator;
  final TextInputType keyboard;
  final FocusNode focusNode;
  final VoidCallback onFinished;
  final bool isPassword;
  final Color background;
  final Color hintColor;
  final double horizontalPadding;
  final Function onValueChanged;
  final String error;

  const OutLinedEditBox(
      {Key key,
      @required this.controller,
      this.hint,
      this.validator,
      this.keyboard = TextInputType.text,
      this.focusNode,
      this.onFinished,
      this.isPassword = false,
      this.horizontalPadding = 5.0,
      this.onValueChanged,
      this.error,
      this.background,
      this.hintColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return OpenFlutterInputFieldState();
  }
}

class OpenFlutterInputFieldState extends State<OutLinedEditBox> {
  String error;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    error = widget.error;

    return Container(
      height: 68,
      margin: EdgeInsets.all(7),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: widget.background, width: 1.0),
                borderRadius: BorderRadius.circular(AppSizes.textFieldRadius),
              ),
              color: widget.background,
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: TextField(
                  onChanged: (value) => widget.onValueChanged(value),
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  keyboardType: widget.keyboard,
                  obscureText: widget.isPassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: widget.hint,
                    labelStyle: TextStyle(color: widget.hintColor),
                    hintText: widget.hint,
                    suffixIcon: Icon(
                      Icons.search,
                      color: widget.hintColor,
                    ),
                    hintStyle: TextStyle(
                        color: widget.hintColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ),
            error == null
                ? Container()
                : Text(
                    error,
                    style: TextStyle(color: AppColors.red, fontSize: 12),
                  )
          ],
        ),
      ),
    );
  }

  String validate() {
    setState(() {
      error = widget.validator(widget.controller.text);
    });
    return error;
  }
}
