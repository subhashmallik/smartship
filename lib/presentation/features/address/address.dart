import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartshipapp/config/config.dart';
import 'package:smartshipapp/presentation/features/address/add_new_address.dart';
import 'package:smartshipapp/presentation/features/address/consignee_address.dart';
import 'package:smartshipapp/presentation/features/address/my_address.dart';


class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                automaticallyImplyLeading: false,
                pinned: true,
                primary: true,
                elevation: 0,
                bottom: PreferredSize(
                  child: Material(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            tabs: [
                              Tab(text: "My Address"),
                              Tab(text: "Consignee Address"),
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
                        IconButton(
                          icon: Icon(
                              FluentSystemIcons.ic_fluent_arrow_sort_filled),
                          onPressed: () {},
                        ),
                        Container(
                          height: 14,
                          width: 1,
                          color: Theme.of(context).hintColor,
                        ),
                        IconButton(
                          icon: Icon(
                              FluentSystemIcons.ic_fluent_settings_dev_filled),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(56),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(bottom: 60),
                  title: Row(
                    children: [
                      Navigator.canPop(context)
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(FluentSystemIcons
                                  .ic_fluent_chevron_left_regular),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color:
                                  Theme.of(context).textTheme.headline6.color,
                            )
                          : SizedBox.shrink(),
                      Expanded(
                        child: Text(
                          "Address Book",
                          style: Theme.of(context).textTheme.headline6,
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
              MyAddress(),
              ConsigneeAddress(),
            ],
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            AppConfig.goto(context, AddNewAddress());
          },
          child: Container(
            width: 50,
            height: 50,
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
            child: Icon(
              FluentSystemIcons.ic_fluent_add_regular,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
