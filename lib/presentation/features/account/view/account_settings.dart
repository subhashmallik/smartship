import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_checkbox.dart';
import 'package:smartshipapp/presentation/widgets/independent/dropdown_input_field.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final TextEditingController eController = TextEditingController();
  double sizeBetween;
  @override
  Widget build(BuildContext context) {
    sizeBetween = 20;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownInputField(
              controller: eController,
              label: 'SELECT LANGUAGE',
              items: ["Select Language", "English", "Arab"],
            ),
            SizedBox(
              height: sizeBetween,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LOCATION ACCESS",
                    style: TextStyle(color: AppColors.white),
                  ),
                  Row(
                    children: [
                      OpenFlutterCheckbox(
                        title: "On",
                        width: 100,
                        checked: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OpenFlutterCheckbox(
                        title: "Off",
                        width: 100,
                        checked: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeBetween,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PUSH NOTIFICATIONS",
                    style: TextStyle(color: AppColors.white),
                  ),
                  Row(
                    children: [
                      OpenFlutterCheckbox(
                        title: "On",
                        width: 100,
                        checked: true,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      OpenFlutterCheckbox(
                        title: "Off",
                        width: 100,
                        checked: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeBetween,
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndSend() {}
}
