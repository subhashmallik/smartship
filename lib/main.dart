import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/localization_delegate.dart';
import 'package:flutter_translate/localization_provider.dart';
import 'package:flutter_translate/localized_app.dart';
import 'package:smartshipapp/authentication/authentication_state.dart';
import 'package:smartshipapp/presentation/features/account/account_screen.dart';
import 'package:smartshipapp/presentation/features/forget_password/forget_password_bloc.dart';
import 'package:smartshipapp/presentation/features/forget_password/forget_password_screen.dart';
import 'package:smartshipapp/presentation/features/home/landing.dart';
import 'package:smartshipapp/presentation/features/otp/otp_bloc.dart';
import 'package:smartshipapp/presentation/features/otp/terms_conditions.dart';
import 'package:smartshipapp/presentation/features/otp/verify_otp_screen.dart';
import 'package:smartshipapp/presentation/features/reset_password/reset_password_bloc.dart';
import 'package:smartshipapp/presentation/features/reset_password/reset_password_screen.dart';
import 'package:smartshipapp/presentation/features/sign_in/sign_in_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_in/signin_screen.dart';
import 'package:smartshipapp/presentation/features/sign_up/sign_up_bloc.dart';
import 'package:smartshipapp/presentation/features/sign_up/signup_screen.dart';
import 'package:smartshipapp/presentation/features/validate/user_validate.dart';
import 'package:smartshipapp/presentation/features/validate/validate_user_screen.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/authentication_event.dart';
import 'config/config.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'data/repositories/abstract/user_repository.dart';
import 'locator.dart' as service_locator;
import 'locator.dart';
import 'presentation/features/wallet/wallet_screen.dart';

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
    BlocProvider<AuthenticationBloc>(
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

    return LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate,
          ],
          supportedLocales: localizationDelegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: localizationDelegate.currentLocale,
          title: 'SmartShip',
          theme: AppTheme.of(context),
          routes: _registerRoutes(),
        ));
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      SmartShipRoutes.splash: (context) =>
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
            if (state is Authenticated) {
              print("AuthenticationState ----- ");
              return Landing();
            } else {
              return Landing(); //_buildSignInBloc();
            }
          }),
      //SmartShipRoutes.splash: (context) => Splash(),
      SmartShipRoutes.validateUser: (context) => _buildUserValidateBloc(),
      SmartShipRoutes.termCondition: (context) => TermCondition(),
      SmartShipRoutes.verifyOTP: (context) => _otpBloc(),
      SmartShipRoutes.home: (context) => WalletScreen(),
      SmartShipRoutes.wallet: (context) => WalletScreen(),
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

  BlocProvider<OtpBloc> _otpBloc() {
    return BlocProvider<OtpBloc>(
      create: (context) => OtpBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: VerifyOTP(),
    );
  }

  BlocProvider<ResetPasswordBloc> _resetPasswordBloc() {
    return BlocProvider<ResetPasswordBloc>(
      create: (context) => ResetPasswordBloc(
        userRepository: RepositoryProvider.of<UserRepository>(context),
      ),
      child: ResetPassword(),
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
}
