import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:smartshipapp/presentation/widgets/independent/clipped_card.dart';
import 'package:smartshipapp/presentation/widgets/independent/title_value_container.dart';


class ConsigneeAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "Search by name, number, location, office, etc.",
                hintStyle: TextStyle(
                  fontSize: 12,
                ),
                suffixIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              ),
            ),
          ),
          SizedBox(height: 25),
          Text(
            "Showing all 124 consignee addresses",
            style: TextStyle(
                color: Theme.of(context).textTheme.headline6.color,
                fontStyle: FontStyle.italic,
                fontSize: 12
            ),
          ),
          SizedBox(height: 20),
          ClippedCard(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TitleValueContainer(
                            icon: FluentSystemIcons.ic_fluent_person_regular,
                            title: "Name",
                            value: "Roman El Najjar",
                          ),
                        ),
                        Expanded(
                          child: TitleValueContainer(
                            icon: FluentSystemIcons.ic_fluent_phone_regular,
                            title: "Number",
                            value: "059 728 6442",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TitleValueContainer(
                      icon: FluentSystemIcons.ic_fluent_location_regular,
                      title: "Address",
                      value: "HSBC, Al Malaz, Riyadh, KSA",
                    ),
                    SizedBox(height: 15),
                    TitleValueContainer(
                      icon: FluentSystemIcons.ic_fluent_store_regular,
                      title: "Retail Centre",
                      value: "Dabab Street, Riyadh, KSA",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "01",
                    textScaleFactor: 2.0,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Theme.of(context).iconTheme.color.withOpacity(0.2)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          // SectionTitle("Home Address"),
          ClippedCard(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TitleValueContainer(
                            icon: FluentSystemIcons.ic_fluent_person_regular,
                            title: "Name",
                            value: "Roman El Najjar",
                          ),
                        ),
                        Expanded(
                          child: TitleValueContainer(
                            icon: FluentSystemIcons.ic_fluent_phone_regular,
                            title: "Number",
                            value: "059 728 6442",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TitleValueContainer(
                      icon: FluentSystemIcons.ic_fluent_location_regular,
                      title: "Address",
                      value: "HSBC, Al Malaz, Riyadh, KSA",
                    ),
                    SizedBox(height: 15),
                    TitleValueContainer(
                      icon: FluentSystemIcons.ic_fluent_store_regular,
                      title: "Retail Centre",
                      value: "Dabab Street, Riyadh, KSA",
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "01",
                    textScaleFactor: 2.0,
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        .copyWith(color: Theme.of(context).iconTheme.color.withOpacity(0.2)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
