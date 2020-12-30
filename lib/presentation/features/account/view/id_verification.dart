import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/dropdown_input_field.dart';

class IDVerification extends StatefulWidget {
  @override
  _IDVerificationState createState() => _IDVerificationState();
}

class _IDVerificationState extends State<IDVerification> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController lController = TextEditingController();
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
              controller: idController,
              label: 'ID TYPE',
              items: ["Select your type of ID", "India", "Arab"],
            ),
            SizedBox(
              height: sizeBetween,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: DottedBorder(
                dashPattern: [8, 4],
                strokeWidth: 2,
                color: AppColors.white,
                child: Container(
                  height: 114,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                        Text(
                          "Upload your documents for verification",
                          style: TextStyle(
                              fontSize: 12.0, color: AppColors.appBlueLightV),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sizeBetween,
            ),
            OpenFlutterButton(
                height: 50,
                title: 'Confirm & Continue',
                onPressed: _validateAndSend),
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
