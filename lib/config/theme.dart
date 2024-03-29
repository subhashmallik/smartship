// Open Flutter E-commerce Light Theme
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:flutter/material.dart';
import 'package:smartshipapp/config/config.dart';

class AppSizes {
  static const int splashScreenTitleFontSize = 48;
  static const int titleFontSize = 34;
  static const double sidePadding = 15;
  static const double widgetSidePadding = 20;
  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double linePadding = 4;
  static const double widgetBorderRadius = 34;
  static const double textFieldRadius = 4.0;
  static const EdgeInsets bottomSheetPadding =
  EdgeInsets.symmetric(horizontal: 16, vertical: 10);
  static const app_bar_size = 56.0;
  static const app_bar_expanded_size = 180.0;
  static const tile_width = 148.0;
  static const tile_height = 276.0;
}

class AppColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const appLightGrey = Color(0xFFBDC7D4);
  static const appRecBundle = Color(0xFF4C6D9F);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const headerIconBg=Color(0xFF1B3458);
  static const Color appBlue = Color(0xFF1B365D);
  static const Color appBlueLight = Color(0xFF3C5A88);
  static const Color appBundleAddCart = Color(0xFF26487B);
  static const Color appWayBillFooterColor = Color(0xFF081B36);
  static const Color appWayBillFooterGrey = Color(0xFF05132780);
  static const Color appBlueLightV = Color(0xFF2D4D79);
  static const Color appBlueDark = Color(0xFF112B50);
  static const Color White = Color(0xFFFFFFFF);
  static const Color appRed = Color(0xFFE84F2B);
  static const Color appWhite = Color(0xFFFF7F3200);
  static const Color appGrey = Color(0xFF8895A8);
  static const Color appGreyLight = Color(0xFFC1C9D3);
  static const Color appOrange = Color(0xFFFF7F32);
  static const Color appOrangeLight = Color(0xFFFFC685);
  static const Color appSkyBlue = Color(0xFF5F8CC9);
  static const Color appSandalLight = Color(0xFFff7F3215);
  static const Color appSandal = Color(0xFFFF7F322E);
  static const Color appSkyBlueLight = Color(0xFF688CC4);
  static const Color appSkyBlueLight1 = Color(0xFF6A8EC4);
  static const Color appSkyBlueLightS = Color(0xFF6084BA);
  static const Color appDivider = Color(0xFF183052);
  static const Color appLightBlue = Color(0xFFA7CCFD);
  static const Color appGreen = Color(0xFF036771);
  static const Color appCyan = Color(0xFF7EE0EA);
  static const Color appCyanDark = Color(0xFF68DBAF);
  static const Color appBlueDark2 = Color(0xFF173D76);
  static const Color appDarkBlue = Color(0xFF152F55);
  static const Color appDarkBlue1 = Color(0xFF2D4C79);
  static const Color appDarkBlue2 = Color(0xFF2A4A79);
  static const Color appDarkBlue3 = Color(0xFF2D4B76);
  static const Color appDarkBlue4 = Color(0xFF1C417A);
  static const Color appDarkBlue5 = Color(0xFF1B2F4B);
  static const Color dashBorder = Color(0xFF496A9D);
  static const Color couponHint = Color(0xFF5F8CC9);
  static const Color appAddressSelectColor = Color(0xFF007884);
  static const Color appEditColor = Color(0xFF1F406F);
  static const Color appCommodityColor = Color(0xFF68D1DB);
}

class AppConsts {
  static const page_size = 20;
}

// Ref: Font Weights: https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html
// Ref: Font Weights for TextTheme: https://api.flutter.dev/flutter/material/TextTheme-class.html
class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: AppColors.black,
      primaryColorLight: AppColors.lightGray,
      bottomAppBarColor: AppColors.lightGray,
      dialogBackgroundColor: AppColors.backgroundLight,
      errorColor: AppColors.red,
      canvasColor: AppConfig.kSwatch,
      accentColor: AppConfig.kAccentColor,
      buttonColor: AppConfig.kButtonColor,
      cardColor: AppConfig.kSwatch,
      hintColor: AppConfig.kHintColor,
      disabledColor: AppConfig.kSwatch[200],
      backgroundColor: AppConfig.kSwatch[900],
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      primaryColorBrightness: Brightness.dark,
      scaffoldBackgroundColor: AppConfig.kScaffoldColor,
      dividerColor: AppConfig.kDividerColor,
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: theme.appBarTheme.copyWith(
          color: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          textTheme: theme.textTheme.copyWith(
              caption: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(
        //over image white text
        headline: theme.textTheme.headline.copyWith(
            fontSize: 48,
            color: AppColors.white,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w900),
        title: theme.textTheme.title.copyWith(
            fontSize: 24,
            color: AppColors.black,
            fontWeight: FontWeight.w900,
            fontFamily: 'Metropolis'),
        //

        //product title
        display1: theme.textTheme.display1.copyWith(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis'),

        display2: theme.textTheme.display2.copyWith(
            fontFamily: 'Metropolis', fontWeight: FontWeight.w400),
        //product price
        display3: theme.textTheme.display3.copyWith(
            color: AppColors.lightGray,
            fontSize: 14,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        display4: theme.textTheme.display4.copyWith(
            fontFamily: 'Metropolis', fontWeight: FontWeight.w500),

        subtitle: theme.textTheme.headline.copyWith(
            fontSize: 18,
            color: AppColors.black,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        subhead: theme.textTheme.headline.copyWith(
            fontSize: 24,
            color: AppColors.darkGray,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500),
        //red button with white text
        button: theme.textTheme.button.copyWith(
            fontSize: 14,
            color: AppColors.white,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w500),
        caption: TextStyle(
            color: AppColors.appOrangeLight,
            fontSize: 26,
            height: AppConfig.kLineHeight,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w700),
        //light gray small text
        body1: theme.textTheme.body1.copyWith(
            color: AppColors.lightGray,
            fontSize: 11,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
        //view all link
        body2: theme.textTheme.body2.copyWith(
            color: AppColors.black,
            fontSize: 11,
            fontFamily: 'Metropolis',
            fontWeight: FontWeight.w400),
      )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: AppColors.red,
      ),
    );
  }

  static Future<T> presentDialogWithChild<T>(BuildContext context, Widget child,
      {EdgeInsets margin, Color barrierColor}) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog<T>(
        barrierColor: barrierColor ?? Colors.black38,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.translate(
            child: Opacity(
              opacity: a1.value,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: GestureDetector(
                    onTap: () {},
                    child: child,
                  ),
                ),
              ),
            ),
            offset: Offset(0, _width - (a1.value * _width)),
          );
        },
        transitionDuration: Duration(milliseconds: 150),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) => null);
  }
}
