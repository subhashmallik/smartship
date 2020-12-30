import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:provider/provider.dart';
import 'package:smartshipapp/presentation/features/account/account_screen.dart';
import 'package:smartshipapp/presentation/features/forget_password/forget_password_bloc.dart';
import 'package:smartshipapp/presentation/features/forget_password/forget_password_screen.dart';
import 'package:smartshipapp/presentation/features/otp/terms_conditions.dart';
import 'package:smartshipapp/presentation/features/otp/verify_otp_screen.dart';
import 'package:smartshipapp/presentation/features/sign_in/sign_in_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_in/signin_screen.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_up/signup_screen.dart';
import 'package:smartshipapp/presentation/features/splash_screen.dart';
import 'package:smartshipapp/presentation/features/validate/user_validate.dart';
import 'package:smartshipapp/presentation/features/validate/validate_user_screen.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_event.dart';
import 'config/app_settings.dart';
import 'config/config.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'data/repositories/abstract/user_repository.dart';
import 'locator.dart' as service_locator;
import 'locator.dart';
import 'presentation/features/home/home_screen.dart';

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() async {
  await service_locator.init();

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'de', 'fr'],
  );

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = SimpleBlocDelegate();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSettings>(
          create: (_) => AppSettings(),
        ),
      ],
      child: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc()..add(AppStarted()),
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<UserRepository>(
              create: (context) => sl(),
            ),
          ],
          child: LocalizedApp(
            delegate,
            SmartShipApp(),
          ),
        ),
      ),
    ),
  );
}

class SmartShipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppConfig.kSwatch[900],
      ),
    );
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return Consumer<AppSettings>(
      builder: (_, AppSettings settings, __) {
        var _textTheme = TextTheme(
          bodyText1: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 14.0 * settings.textScale,
            fontWeight: FontWeight.bold,
            fontFamily: settings.fontName,
          ),
          bodyText2: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          subtitle1: TextStyle(
            color: AppConfig.kSwatch,
            fontSize: 18 * settings.textScale,
            fontWeight: FontWeight.w900,
            fontFamily: settings.fontName,
          ),
          subtitle2: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
          headline1: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 35 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline2: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 28 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline3: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 24 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline4: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 21 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline5: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 18 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          headline6: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 16 * settings.textScale,
            fontWeight: FontWeight.w900,
          ),
          caption: TextStyle(
            color: AppConfig.kSwatch[400],
            fontFamily: settings.fontName,
            fontSize: 13 * settings.textScale,
            fontWeight: FontWeight.w300,
          ),
          button: TextStyle(
            color: AppConfig.kSwatch,
            fontWeight: FontWeight.w900,
            fontSize: 12 * settings.textScale,
            fontFamily: settings.fontName,
          ),
          overline: TextStyle(
            color: AppConfig.kSwatch,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
          ),
        );
        var _textThemeDark = TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
            fontWeight: FontWeight.w900,
            height: AppConfig.kLineHeight,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 14.0 * settings.textScale,
            fontFamily: settings.fontName,
            height: AppConfig.kLineHeight,
          ),
          subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 18.0 * settings.textScale,
            fontWeight: FontWeight.w900,
            fontFamily: settings.fontName,
            height: AppConfig.kLineHeight,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
            height: AppConfig.kLineHeight,
          ),
          headline1: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 35 * settings.textScale,
            fontWeight: FontWeight.w700,
            height: AppConfig.kLineHeight,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 30 * settings.textScale,
            fontWeight: FontWeight.w700,
            height: AppConfig.kLineHeight,
          ),
          headline3: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 28 * settings.textScale,
            fontWeight: FontWeight.w700,
            height: AppConfig.kLineHeight,
          ),
          headline4: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 25 * settings.textScale,
            fontWeight: FontWeight.w700,
            height: AppConfig.kLineHeight,
          ),
          headline5: TextStyle(
            color: AppConfig.kTitleColor,
            fontFamily: settings.fontName,
            fontSize: 22 * settings.textScale,
            fontWeight: FontWeight.w700,
            height: AppConfig.kLineHeight,
          ),
          headline6: TextStyle(
            color: AppConfig.kTitleColor,
            fontFamily: settings.fontName,
            fontSize: 25 * settings.textScale,
            fontWeight: FontWeight.w900,
            height: AppConfig.kLineHeight,
          ),
          caption: TextStyle(
            color: AppConfig.kHintColor,
            fontFamily: settings.fontName,
            fontSize: 14 * settings.textScale,
            fontWeight: FontWeight.w300,
            height: AppConfig.kLineHeight,
          ),
          button: TextStyle(
            color: AppConfig.kButtonColor,
            fontWeight: FontWeight.w900,
            fontSize: 12 * settings.textScale,
            fontFamily: settings.fontName,
            height: AppConfig.kLineHeight,
          ),
          overline: TextStyle(
            color: Colors.white,
            fontFamily: settings.fontName,
            fontSize: 14.0 * settings.textScale,
            height: AppConfig.kLineHeight,
          ),
        );

        var _inputTheme = InputDecorationTheme(
          filled: true,
          fillColor: AppConfig.kCanvasColor,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        );

        var _inputThemeDark = InputDecorationTheme(
          filled: true,
          fillColor: AppConfig.kCanvasColor,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        );

        var _theme = ThemeData(
          primarySwatch: AppConfig.kSwatch,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            height: 36,
            buttonColor: Color(settings.color),
          ),
          popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
          ),
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          accentColor: Color(settings.color),
          buttonColor: Color(settings.color),
          cardColor: Colors.white,
          backgroundColor: AppConfig.kSwatch[50],
          dividerColor: AppConfig.kSwatch[100],
          hintColor: AppConfig.kSwatch[200],
          primaryColorBrightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          textTheme: _textTheme,
          inputDecorationTheme: _inputTheme,
          appBarTheme: AppBarTheme(
            textTheme: _textTheme,
            elevation: 1.0,
            // brightness: Brightness.dark,
            // actionsIconTheme: IconThemeData(color: Color(settings.color)),
          ),
          chipTheme: ChipThemeData(
            backgroundColor: AppConfig.kSwatch[50],
            disabledColor: AppConfig.kSwatch,
            selectedColor: Color(settings.color),
            secondarySelectedColor: Color(settings.color),
            padding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            labelStyle: _textTheme.bodyText2,
            secondaryLabelStyle:
                _textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
            brightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: AppConfig.kTitleColor),
          fontFamily: settings.fontName,
        );
        var _darkTheme = ThemeData(
          primarySwatch: AppConfig.kSwatch,
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            height: 36,
            buttonColor: AppConfig.kAccentColor,
          ),
          popupMenuTheme: PopupMenuThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
          ),
          inputDecorationTheme: _inputThemeDark,
          primaryColor: AppConfig.kSwatch,
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
          textTheme: _textThemeDark,
          appBarTheme: AppBarTheme(
            textTheme: _textThemeDark,
            elevation: 0.0,
            color: AppConfig.kSwatch,
            iconTheme: IconThemeData(color: AppConfig.kTitleColor),
            // actionsIconTheme: IconThemeData(color: Color(settings.color)),
          ),
          chipTheme: ChipThemeData(
            backgroundColor: AppConfig.kCanvasColor,
            disabledColor: AppConfig.kSwatch[300],
            selectedColor: AppConfig.kAccentColor,
            secondarySelectedColor: AppConfig.kAccentColor,
            padding: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.kRadiusSmall),
            ),
            labelStyle: _textThemeDark.button,
            secondaryLabelStyle: _textThemeDark.button,
            brightness: Brightness.dark,
          ),
          dividerColor: AppConfig.kDividerColor,
          iconTheme: IconThemeData(color: Colors.white),
          fontFamily: settings.fontName,
        );

        return LocalizationProvider(
            state: LocalizationProvider.of(context).state,
            child: MaterialApp(
              theme: AppTheme.of(context),
              darkTheme: _darkTheme,
              themeMode: ThemeMode.dark,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                localizationDelegate,
              ],
              //onGenerateRoute: _registerRoutesWithParameters,
              supportedLocales: localizationDelegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              locale: localizationDelegate.currentLocale,
              title: 'SmartShip',

              routes: _registerRoutes(),
            ));
      },
    );
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      // SmartShipRoutes.splash: (context) =>
      //     BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //         builder: (context, state) {
      //       print("AuthenticationState ----- $AuthenticationState");
      //       // if (state is Authenticated) {
      //       //   return SignUpScreen();
      //       // } else {
      //       //   return SignInScreen();
      //       // }
      //       return SignInScreen();
      //     }),
      SmartShipRoutes.splash: (context) => Splash(),
      SmartShipRoutes.validateUser: (context) => _buildUserValidateBloc(),
      SmartShipRoutes.termCondition: (context) => TermCondition(),
      SmartShipRoutes.verifyOTP: (context) => VerifyOTP(),
      SmartShipRoutes.home: (context) => HomeScreen(),
      SmartShipRoutes.account: (context) => AccountScreen(),
      SmartShipRoutes.signin: (context) => _buildSignInBloc(),
      SmartShipRoutes.signup: (context) => _buildSignUpBloc(),
      SmartShipRoutes.forgotPassword: (context) => _buildForgetPasswordBloc(),
    };
  }

  BlocProvider<ForgetPasswordBloc> _buildForgetPasswordBloc() {
    return BlocProvider<ForgetPasswordBloc>(
      create: (context) => ForgetPasswordBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: ForgetPasswordScreen(),
    );
  }

  BlocProvider<SignInBloc> _buildSignInBloc() {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      ),
      child: SignInScreen(),
    );
  }

  BlocProvider<UserValidateBloc> _buildUserValidateBloc() {
    return BlocProvider<UserValidateBloc>(
      create: (context) => UserValidateBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: ValidateUser(),
    );
  }

  BlocProvider<SignUpBloc> _buildSignUpBloc() {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      ),
      child: SignUpScreen(),
    );
  }

  Route _registerRoutesWithParameters(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return SignInScreen();
      },
    );
  }
}
