import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/widgets/independent/clickable_line.dart';
import 'package:smartshipapp/presentation/widgets/independent/custom_button.dart';
import 'package:smartshipapp/presentation/widgets/independent/input_field.dart';

class RetailCenter extends StatefulWidget {
  @override
  _RetailCenterState createState() => _RetailCenterState();
}

class _RetailCenterState extends State<RetailCenter> {
  final TextEditingController sController = TextEditingController();
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
            InputField(
              controller: sController,
              label: 'SELECT PREFERRED RETAIL CENTRE',
              hint: 'Search the preferred retail centre',
              suffixIcon: Icons.search,
              required: false,
            ),
            SizedBox(
              height: sizeBetween,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  color: AppColors.appOrangeLight,
                  size: 18,
                ),
                OpenFlutterClickableLine(
                  height: 50,
                  width: 150,
                  title: "VIEW MAP VIEW",
                  textColor: AppColors.appOrangeLight,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "“Recommended retail centres”",
                      style: TextStyle(fontSize: 12.0, color: AppColors.white),
                    ),
                  ),
                  Text(
                    "View all centres",
                    style: TextStyle(fontSize: 12.0, color: AppColors.white),
                  ),
                  Icon(
                    Icons.arrow_circle_down,
                    color: AppColors.white,
                    size: 18,
                  )
                ],
              ),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    height: 140,
                    child: Card(
                      color: AppColors.appBlueDark,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              position.toString(),
                              style: TextStyle(fontSize: 22.0),
                            ),
                            Text(
                              "Dabab STreet, Riyadh",
                              style: TextStyle(
                                  fontSize: 14.0, color: AppColors.white),
                            ),
                            Text(
                              "1.2 km away",
                              style: TextStyle(
                                  fontSize: 13.0, color: AppColors.appOrange),
                            ),
                            Text(
                              "Fantasy square, Plots # 1&2, Gachibowli, Near Biodiversity Junction, Gachibowli, 500032",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.appBlueLightV),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
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
