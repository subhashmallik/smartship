import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/account/view/account_settings.dart';
import 'package:smartshipapp/presentation/features/account/view/bank_details.dart';
import 'package:smartshipapp/presentation/features/account/view/id_verification.dart';
import 'package:smartshipapp/presentation/features/account/view/personal_information.dart';
import 'package:smartshipapp/presentation/features/account/view/retail_center.dart';
import 'package:smartshipapp/presentation/widgets/independent/expansion_tile.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  double sizeBetween;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    sizeBetween = height / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      backgroundColor: AppColors.appBlueDark2,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OpenFlutterExpansionTile(
                title: "Personal Information",
                description: "Incomplete",
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: AppColors.white,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                children: [PersonalInformation()],
                // validator: Validator.valueExists,
              ),
              SizedBox(
                height: sizeBetween,
              ),
              OpenFlutterExpansionTile(
                title: "Preferred Retail Centre",
                description: "Not Selected",
                leading: Icon(
                  Icons.tram_rounded,
                  color: AppColors.white,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                children: [RetailCenter()],
                // validator: Validator.valueExists,
              ),
              SizedBox(
                height: sizeBetween,
              ),
              OpenFlutterExpansionTile(
                title: "ID Verification",
                description: "Verification Pending",
                leading: Icon(
                  Icons.list_alt_sharp,
                  color: AppColors.white,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                children: [IDVerification()],
                // validator: Validator.valueExists,
              ),
              SizedBox(
                height: sizeBetween,
              ),
              OpenFlutterExpansionTile(
                title: "Bank Details",
                description: "Details Required",
                leading: Icon(
                  Icons.food_bank_outlined,
                  color: AppColors.white,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                children: [BankDetails()],
                // validator: Validator.valueExists,
              ),
              SizedBox(
                height: sizeBetween,
              ),
              OpenFlutterExpansionTile(
                title: "Account Settings",
                description: "",
                leading: Icon(
                  Icons.settings,
                  color: AppColors.white,
                ),
                trailing: Icon(
                  Icons.add,
                  color: AppColors.white,
                ),
                children: [AccountSettings()],
                // validator: Validator.valueExists,
              ),
              SizedBox(
                height: sizeBetween,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
