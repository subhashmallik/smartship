import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/dropdown_input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';

class BankDetails extends StatefulWidget {
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController cController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  final TextEditingController ibanController = TextEditingController();
  double sizeBetween;
  @override
  Widget build(BuildContext context) {
    sizeBetween = 20;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              controller: aController,
              label: 'Account holder name',
              hint: 'Enter Account holder name',
              // validator: Validator.valueExists,
            ),
            DropdownInputField(
              controller: cController,
              label: 'COUNTRY',
              items: ["Select Country", "India", "Arab"],
              // validator: Validator.valueExists,
            ),
            DropdownInputField(
              controller: bController,
              label: 'BANK NAME',
              items: ["Select Bank Name", "Delhi", "New Delhi", "Hyderabad"],
              // validator: Validator.valueExists,
            ),
            InputField(
              controller: ibanController,
              label: 'IBAN',
              hint: 'Enter IBAN',
              // validator: Validator.valueExists,
            ),
            SizedBox(
              height: sizeBetween,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Make sure your name and bank information match your bank account. Otherwise your transaction won't go through and you’ll be charged a fee."),
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
