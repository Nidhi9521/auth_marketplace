import 'package:auth_marketplace/core/core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:auth_marketplace/core/routes/navigation_observer.dart';
import 'dart:io';
import 'package:auth_marketplace/core/utils/hive_manager.dart';
import 'package:auth_marketplace/features/login/data/models/user_model.dart';
import 'package:hive/hive.dart';

import 'package:auth_marketplace/features/login/login_dependency_injection.dart'
    as diLogin;
import 'package:auth_marketplace/features/about/about_dependency_injection.dart'
    as diAbout;
import 'package:auth_marketplace/features/contactus/contactus_dependency_injection.dart'
    as diContactus;
import 'package:auth_marketplace/features/onboard/onboard_dependency_injection.dart'
    as diOnboard;
import 'package:auth_marketplace/features/signup/signup_dependency_injection.dart'
    as diSignUp;

import 'package:flutter/src/services/system_chrome.dart';

enum Environment {
  dev,
  prod,
}

Future<void> mainCommon(Environment env) async {
  hiveBox = await HiveManager.create(boxName: HiveBoxName.hiveBox);
  Hive.registerAdapter(UserModelAdapter());

  await dotenv.load(
      fileName: "${env.name}.env", mergeWith: Platform.environment);

  await injectingDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'marketPlace',
      theme: MarketPlaceThemes.lightTheme,
      darkTheme: MarketPlaceThemes.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.generateRoutes,
      navigatorObservers: [NavigationObserver()],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }

        /// Add your logic to get language
        return supportedLocales.first;
      },
      supportedLocales: LocalizationConstants.languages
          .map((language) => Locale(language, '')),
    );
  }
}

Future<void> injectingDependencies() async {
  Future.wait([
    diLogin.loginInit(),
    diAbout.aboutInit(),
    diContactus.contactusInit(),
    diOnboard.onboardInit(),
    diSignUp.signUpInit()
  ]);
}
