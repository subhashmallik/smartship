
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/shipments/shipmentaddrdetail/shipment_address_details.dart';
import 'package:smartshipapp/presentation/features/shipments/shipmentdetails/shipment_details.dart';



class AddShipment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 240,
                automaticallyImplyLeading: false,
                pinned: true,
                primary: true,
                elevation: 0,
                bottom: PreferredSize(
                  child: Material(
                    color: AppColors.appBlueDark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "01",
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 24),
                                    ),
                                    Text("Address Details"),
                                  ],
                                ),
                              ),
                              Tab(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "02",
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 24),
                                    ),
                                    Text("Shipment Details"),
                                  ],
                                ),
                              ),
                              Tab(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "03",
                                      style: TextStyle(
                                          color: AppColors.appGrey,
                                          fontSize: 24),
                                    ),
                                    Text("Shipment Summary"),
                                  ],
                                ),
                              ),
                            ],
                            labelColor:
                                Theme.of(context).textTheme.bodyText2.color,
                            unselectedLabelColor: Theme.of(context).hintColor,
                            isScrollable: true,
                            indicatorWeight: 3,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(77),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 66),
                  title: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                            FluentSystemIcons.ic_fluent_chevron_left_regular),
                        onPressed: () {},
                        color: Theme.of(context).textTheme.headline6.color,
                      ),
                      Expanded(
                        child: Text(
                          "New Shipment",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  background: Align(
                    alignment: Alignment(1.08, 0),
                    child: Icon(
                      FluentSystemIcons.ic_fluent_cube_filled,
                      color: Colors.white24,
                      size: 80,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ShipmentAddressDetails(),
              ShipmentDetails(),
              ShipmentDetails(),
            ],
          ),
          physics: ClampingScrollPhysics(),
        ),


      ),
    );
  }
}
