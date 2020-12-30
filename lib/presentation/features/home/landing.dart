import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartshipapp/config/theme.dart';
import 'package:smartshipapp/presentation/features/more/more.dart';
import 'package:smartshipapp/presentation/features/packages/my_packages.dart';
import 'package:smartshipapp/presentation/features/shipments/my_shipments.dart';
import 'package:smartshipapp/presentation/widgets/extensions/clippers.dart';
import 'package:smartshipapp/presentation/widgets/independent/sliver_header_bar.dart';

import 'home_screen.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentIndex = 0;

  get _getPage {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return MyPackages();
      case 2:
        return MyShipments();
      case 3:
        return More();
      default:
        return Center(
          child: Text("Coming Soon!"),
        );
    }
  }

  get _getName {
    switch (_currentIndex) {
      case 0:
        return "Dashboard";
      case 1:
        return "MyPackages";
      case 2:
        return "MyShipments";
      case 3:
        return "More";
      default:
        return Center(
          child: Text("Coming Soon!"),
        );
    }
  }

  _onTap(int index) => {setState(() => _currentIndex = index)};

  Color colorByIndex(ThemeData theme, int index) {
    print(index);
    return index == _currentIndex ? AppColors.appOrange : AppColors.appGrey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverHeaderBar(_getName),
          ];
        },
        body: _getPage,
      ),
      bottomNavigationBar: ClipPath(
        clipper: TopClipper(15),
        child: BottomNavigationBar(
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: AppColors.appOrange,
          unselectedItemColor: Theme.of(context).hintColor,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                height: 24.0,
                width: 24.0,
                color: colorByIndex(Theme.of(context), _currentIndex),
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/packages.svg",
                height: 24.0,
                width: 24.0,
                color: colorByIndex(Theme.of(context), _currentIndex),
              ),
              label: "My Packages",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/shipment.svg",
                height: 24.0,
                width: 24.0,
                color: colorByIndex(Theme.of(context), _currentIndex),
              ),
              label: "My Shipments",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/more.svg",
                height: 24.0,
                width: 24.0,
                color: colorByIndex(Theme.of(context), _currentIndex),
              ),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}
