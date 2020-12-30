import 'package:flutter/material.dart';

class CountryPicker extends StatelessWidget {
  var _items = [
    Country("91", "India"),
    Country("92", "Pakistan"),
    Country("977", "Nepal"),
    Country("974", "United Arab Emirates"),
    Country("971", "Saudi Arabia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: SafeArea(
        child: Scaffold(
          body: ListView.separated(
            itemBuilder: (_, int index) => ListTile(
              title: Text(_items[index].name),
              onTap: () => Navigator.pop(context, _items[index]),
              visualDensity: VisualDensity.compact,
              trailing: Text("+${_items[index].isoCode}"),
            ),
            separatorBuilder: (_, int index) => Divider(),
            itemCount: _items.length,
          ),
        ),
      ),
    );
  }
}

class Country {
  final String isoCode;
  final String name;

  Country(this.isoCode, this.name);
}
