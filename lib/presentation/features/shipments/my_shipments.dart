import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/shipments/add_shipment.dart';
import 'package:smartshipapp/presentation/widgets/independent/list_item_card.dart';
import 'package:smartshipapp/presentation/widgets/independent/outlined_edit_box.dart';

class MyShipments extends StatefulWidget{
  @override
  _MyShipmentsState createState() => _MyShipmentsState();
}

class _MyShipmentsState extends State<MyShipments> {
  final TextEditingController nameController = TextEditingController();
  var nameKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.appBlue,
      // appBar: AppBar(
      //   title: Text('My Shipments'),
      // ),
      body: SingleChildScrollView(
        // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //   return [
        //     SliverAppBar(
        //       expandedHeight: 200,
        //       automaticallyImplyLeading: false,
        //       pinned: true,
        //       primary: true,
        //       elevation: 0,
        //       bottom: PreferredSize(
        //         child: Material(
        //           color: Theme.of(context).scaffoldBackgroundColor,
        //           child: Row(
        //             children: [
        //               IconButton(
        //                 icon: Icon(
        //                     FluentSystemIcons.ic_fluent_arrow_sort_filled),
        //                 onPressed: () {},
        //               ),
        //               Container(
        //                 height: 14,
        //                 width: 1,
        //                 color: Theme.of(context).hintColor,
        //               ),
        //               IconButton(
        //                 icon: Icon(
        //                     FluentSystemIcons.ic_fluent_settings_dev_filled),
        //                 onPressed: () {},
        //               ),
        //             ],
        //           ),
        //         ),
        //         preferredSize: Size.fromHeight(56),
        //       ),
        //       flexibleSpace: FlexibleSpaceBar(
        //         titlePadding: EdgeInsets.only(bottom: 56),
        //         title: Row(
        //           children: [
        //             IconButton(
        //               icon: Icon(FluentSystemIcons.ic_fluent_chevron_left_regular),
        //               onPressed: () {},
        //               color: Theme.of(context).textTheme.headline6.color,
        //             ),
        //             Expanded(
        //               child: Text(
        //                 "Address Book",
        //                 style: Theme.of(context).textTheme.headline6,
        //               ),
        //             ),
        //           ],
        //         ),
        //         background: Align(
        //           alignment: Alignment(1.08, 0),
        //           child: Icon(
        //             FluentSystemIcons.ic_fluent_cube_filled,
        //             color: Colors.white24,
        //             size: 80,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ];
        // },
        child: Container(
          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(6),
                color: AppColors.appBlue,
                child: Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor '
                      'invidunt ut labore magna',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                  textAlign: TextAlign.start,
                  softWrap: true,
                ),
              ),
              Container(
                color: AppColors.appBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: OutLinedEditBox(
                        key: nameKey,
                        background: AppColors.appBlueLight,
                        controller: nameController,
                        hintColor: AppColors.appSkyBlueLight,
                        hint: 'Search Shipments',
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      child: SvgPicture.asset(
                        "assets/images/sort.svg",
                        height: 22.0,
                        width: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      child: SvgPicture.asset(
                        "assets/images/filter.svg",
                        height: 22.0,
                        width: 22.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListItemCard(
                  "assets/images/inprogress.svg", "In Progress", "4 Shipments"),
              ListItemCard(
                  "assets/images/delivered.svg", "Delivered", "4 Shipments"),
              ListItemCard(
                  "assets/images/cancelled.svg", "Cancelled", "4 Shipments"),
              ListItemCard("assets/images/open.svg", "Open", "4 Shipments"),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).buttonColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddShipment()));
          },
          child: Icon(
            FluentSystemIcons.ic_fluent_add_regular,
            size: 32,
          ),
        ),
      ),
    );
  }
}