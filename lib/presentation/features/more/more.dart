import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/account/account_screen.dart';
import 'package:smartshipapp/presentation/features/address/address.dart';

class More extends StatelessWidget {
  var _items = [
    {
      "i": "assets/images/wallet.svg",
      "t": "Wallet",
    },
    {
      "i": "assets/images/reports.svg",
      "t": "Report",
    },
    {
      "i": "assets/images/moreaddr.svg",
      "t": "Address Book",
    },
    {
      "i": "assets/images/account.svg",
      "t": "Account",
    },
    {
      "i": "assets/images/settings.svg",
      "t": "Settings",
    },
    {
      "i": "assets/images/hrlp.svg",
      "t": "Help",
    },
    {
      "i": "assets/images/logout.svg",
      "t": "Logout",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, int index) => new GestureDetector(
        onTap: () {
          _getItemClickIndex(context, index);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SvgPicture.asset(
                _items[index]["i"],
                color: AppColors.white,
              ),
              SizedBox(width: 10),
              Expanded(child: Text(_items[index]["t"])),
              SizedBox(width: 10),
              Icon(
                FluentSystemIcons.ic_fluent_arrow_right_circle_regular,
              ),
            ],
          ),
        ),
      ),
      itemCount: _items.length,
      separatorBuilder: (BuildContext context, int index) =>
          Divider(thickness: 1),
    );
  }

  _getItemClickIndex(BuildContext cxt, int index) {
    switch (index) {
      case 2:
        redirectView(cxt, Address());
        break;
      case 3:
        redirectView(cxt, AccountScreen());
        break;
      default:
        ;
    }
  }

  void redirectView(BuildContext cxt, Widget myShipments) {
    Navigator.push(cxt, MaterialPageRoute(builder: (context) => myShipments));
  }
}
