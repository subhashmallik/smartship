import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartshipapp/presentation/widgets/extensions/page_routes.dart';
import 'package:smartshipapp/presentation/widgets/extensions/session.dart';

class AppConfig {
  static Color kScaffoldColor = Color(0xff14245f);
  static Color kButtonColor = Color(0xfff83f06);
  static Color kAccentColor = Color(0xffF67E31);
  static Color kHintColor = Color(0xff4e64a4);
  static Color kDividerColor = Color(0xff091450);
  static Color kErrorColor = Color(0xffcd0909);
  static Color kCanvasColor = Color(0xff091450);
  static Color kPrimaryColor = Color(0xff091450);

//Text Color
  static Color kTitleColor = Color(0xffebbe7d);
  static double kLineHeight = 1.2;

  //Other colors
  static Color successColor = Color(0xff9080fe);

  static double kRadius = 0.0;
  static double kRadiusSmall = 0.0;
  static double kRadiusSmallest = 0.0;

  static MaterialColor kSwatch = MaterialColor(0xff091450, {
    50: Color(0xffdce8f7),
    100: Color(0xffbad1f0),
    200: Color(0xff76a3e2),
    300: Color(0xff3275d3),
    400: Color(0xff1f4f94),
    500: Color(0xff091450),
    600: Color(0xff0f2648),
    700: Color(0xff0d2240),
    800: Color(0xff0b1e37),
    900: Color(0xff0a192f),
  });

  Future<bool> launchURL(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    //   return true;
    // }
    throw "Link not valid!";
  }

  static Future logout(BuildContext context) {
    Session.logout();
    return Navigator.pushNamedAndRemoveUntil(
      context,
      "/login",
      ModalRoute.withName("/splash"),
    );
  }

  static Future goto(BuildContext context, Widget page,
      {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (_) => page),
      );
    }
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => page),
    );
  }

  static Future popGoto(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (_) => page), (v) => true);
  }

  static Future animateTo(BuildContext context, Widget page) => Navigator.push(
        context,
        HeroDialogRoute(builder: (_) => page),
      );

  static Tween<BorderRadius> _kFrontHeadingBevelRadius = new BorderRadiusTween(
    begin: const BorderRadius.only(
      topRight: Radius.circular(20.0),
    ),
  );
  static void showSnackBar(String message,
      {BuildContext context,
      GlobalKey<ScaffoldState> key,
      Color color = Colors.pink,
      IconData icon}) {
    var snackBar = SnackBar(
      shape: new BeveledRectangleBorder(
        borderRadius: _kFrontHeadingBevelRadius.begin,
      ),
      content: Text(message),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    );
    if (key == null) {
      Scaffold.of(context).showSnackBar(snackBar);
    } else {
      key.currentState.showSnackBar(snackBar);
    }
  }

  static Future<bool> presentMessage(
    BuildContext context, {
    @required String message,
    IconData icon,
    double iconSize,
    Color iconColor,
    String buttonText,
    Color buttonTint,
  }) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog(
        barrierColor: Colors.black54,
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
                  body: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Icon(
                              icon ?? Icons.info,
                              size: iconSize ?? 48,
                              color: iconColor ?? Colors.green,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                message ?? "",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                              ),
                            ),
                            Divider(height: 1),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                child: FlatButton(
                                  textColor: buttonTint ??
                                      Theme.of(context).accentColor,
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    buttonText ?? "OK",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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

  static Future<bool> presentDialog(
    BuildContext context, {
    @required IconData icon,
    @required String title,
    @required String message,
    String positiveButtonText,
    String negativeButtonText,
    Color negativeTint,
    Color positiveTint,
    Color headerColor,
  }) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog(
        barrierColor: Colors.black54,
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
                  body: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 10,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius:
                              BorderRadius.circular(AppConfig.kRadiusSmall),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: headerColor ??
                                    Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(AppConfig.kRadiusSmall),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    icon ?? Icons.arrow_right,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        title ?? "",
                                        textScaleFactor: 1.3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Text(
                                message ?? "",
                                textAlign: TextAlign.center,
                                textScaleFactor: 1.2,
                              ),
                            ),
                            Divider(height: 1),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: FlatButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      textColor: negativeTint ?? null,
                                      child: Text(
                                        negativeButtonText ??
                                            "Cancel".toUpperCase(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      textColor: positiveTint ??
                                          Theme.of(context).accentColor,
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: Text(
                                        positiveButtonText ??
                                            "Submit".toUpperCase(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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

  static Future<T> presentDialogWithChild<T>(BuildContext context, Widget child,
      {EdgeInsets margin, Color barrierColor}) {
    var _width = MediaQuery.of(context).size.width;
    return showGeneralDialog<T>(
        barrierColor: barrierColor ?? Colors.black87,
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
