import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/dropdown_input_field.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';

class PersonalInformation extends StatefulWidget {
  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final TextEditingController fController = TextEditingController();
  final TextEditingController lController = TextEditingController();
  final TextEditingController pController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  var _key = GlobalKey<ScaffoldState>();
  static const _PANEL_HEADER_HEIGHT = 32.0;
  static const double _kFrontHeadingHeight = 100.0;
  double sizeBetween;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(50.0),
    ),
    end: const BorderRadius.only(
      topRight: Radius.circular(_kFrontHeadingHeight),
    ),
  );

  @override
  Widget build(BuildContext context) {
    sizeBetween = 20;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              controller: fController,
              label: 'first name',
              hint: 'Enter first name',
              suffixIcon: Icons.account_circle_outlined,
              required: true,
              // validator: Validator.valueExists,
            ),
            InputField(
              controller: lController,
              label: 'last name',
              hint: 'Enter last name',
              suffixIcon: Icons.account_circle_outlined,
              required: true,
              // validator: Validator.valueExists,
            ),
            InputField(
              controller: pController,
              label: 'phone number',
              hint: 'Enter your phone number',
              suffixIcon: Icons.phone,
              required: true,
              // validator: Validator.valueExists,
            ),
            InputField(
              controller: emailController,
              label: 'Email',
              hint: 'Enter your email',
              suffixIcon: Icons.email,
              required: true,
            ),
            InputField(
              controller: dateController,
              label: 'Date Of birth',
              hint: 'DD|MM|YYYY',
              suffixIcon: Icons.calendar_today_outlined,
              required: true,
              //  validator: Validator.passwordCorrect,
            ),
            DropdownInputField(
              controller: genderController,
              label: 'Gender',
              items: ["Select Gender", "Male", "Female", "Other"],
              required: true,
              // validator: Validator.valueExists,
            ),
            DropdownInputField(
              controller: cityController,
              label: 'City',
              items: ["Select City", "Delhi", "New Delhi", "Hyderabad"],
              required: true,
              // validator: Validator.valueExists,
            ),
            DropdownInputField(
              controller: cController,
              label: 'Country',
              items: ["Select Country", "India", "Arab"],
              required: true,
              // validator: Validator.valueExists,
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

  void _validateAndSend() {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        shape: new BeveledRectangleBorder(
          borderRadius: _kFrontHeadingBevelRadius.begin,
        ),
        content: Text('continue pressed'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
