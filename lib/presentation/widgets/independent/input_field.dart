import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartshipapp/config/theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget prefix;
  final IconData suffixIcon;
  final String helpText;
  final TextInputType inputType;
  final TextCapitalization capitalization;
  final bool enable;
  final bool lessLeftMargin;
  final bool lessRightMargin;
  final bool noTopMargin;
  final TextEditingController controller;
  final Function(String str) validator;
  final List<TextInputFormatter> formatter;
  final FocusNode focusNode;
  final bool autoFocus;
  final String error;
  final Widget suffixWidget;
  final bool required;
  final int minLines;
  final int maxLines;
  final Color fillColor;
  final Color textColor;
  final Color labelColor;
  final void Function(String v) onChanged;
  final bool obscureText;

  const InputField({
    Key key,
    this.label,
    this.prefix,
    this.onChanged,
    this.suffixIcon,
    this.helpText,
    this.inputType,
    this.fillColor,
    this.textColor,
    this.capitalization = TextCapitalization.none,
    this.enable = true,
    this.lessLeftMargin = false,
    this.lessRightMargin = false,
    this.controller,
    this.validator,
    this.formatter,
    this.focusNode,
    this.hint,
    this.noTopMargin = false,
    this.autoFocus = false,
    this.required = false,
    this.error,
    this.suffixWidget,
    this.minLines,
    this.maxLines,
    this.obscureText = false,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      padding: EdgeInsets.only(
          left: lessLeftMargin ? 5 : 15,
          right: lessRightMargin ? 5 : 15,
          top: noTopMargin ? 0 : 10,
          bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          label == null
              ? SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 0, top: 5, bottom: 3),
                  child: Row(
                    children: <Widget>[
                      (required ?? false)
                          ? Text(
                              "*",
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                          : SizedBox.shrink(),
                      Flexible(
                        child: Text(
                          label.toUpperCase(),
                          textScaleFactor: 0.9,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                            color: textColor ?? AppColors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Theme.of(context).buttonColor,
            ),
            child: PhysicalShape(
              color: AppColors.appBlueLightV,
              clipper: new ShapeBorderClipper(
                  shape: new BeveledRectangleBorder(
                borderRadius: _kFrontHeadingBevelRadius.begin,
              )),
              child: TextFormField(
                validator: validator,
                autofocus: autoFocus,
                minLines: minLines ?? 1,
                maxLines: maxLines ?? 1,
                onChanged: onChanged,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor ?? AppColors.white,
                  decoration: TextDecoration.none,
                ),
                controller: controller,
                keyboardType: inputType,
                enabled: enable,
                inputFormatters: formatter,
                textCapitalization: capitalization,
                focusNode: focusNode,
                obscureText: obscureText,
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: AppColors.appSkyBlue,
                      fontSize: 16,
                      fontFamily: 'DIN'),
                  suffixIcon: suffixWidget == null
                      ? suffixIcon == null
                          ? null
                          : Icon(
                              suffixIcon,
                              color: AppColors.white,
                            )
                      : suffixWidget,
                  prefixIcon: prefix,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
