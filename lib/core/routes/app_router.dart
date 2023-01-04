import '../../dashboard_page.dart';
import '../core.dart';

import '../../features/login/presentation/pages/login_page.dart';
import '../../features/about/presentation/pages/about_page.dart';
import '../../features/onboard/presentation/pages/onboard_page.dart';
import '../../features/contactus/presentation/pages/contactus_page.dart';
import '../../features/signup/presentation/pages/signup_page.dart';
import '../../features/login/presentation/pages/forget_password_page.dart';


import '../widgets/page_not_found.dart';
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

import 'package:auth_marketplace/features/login/presentation/cubit/login_cubit.dart';
import 'package:auth_marketplace/features/about/presentation/cubit/about_cubit.dart';
import 'package:auth_marketplace/features/contactus/presentation/cubit/contactus_cubit.dart';
import 'package:auth_marketplace/features/onboard/presentation/cubit/onboard_cubit.dart';
import 'package:auth_marketplace/features/signup/presentation/cubit/signup_cubit.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kRouteSplash:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return BlocProvider(
                create: (context) => diOnboard.slOnboard<OnBoardCubit>(),
                child: Splash(),
              );
            });
      case Routes.kRouteDashBoard:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return DashBoard();
            });

      case Routes.kRouteLogin:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return BlocProvider(
                create: (context) => diLogin.slLogin<LoginCubit>(),
                child: Login(),
              );
            });

      case Routes.kRouteContactUs:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return BlocProvider(
                create: (context) => diContactus.slContactus<ContactUsCubit>(),
                child: ContactUsHome(),
              );
            });

      case Routes.kRouteForgetPassword:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return ForgetPasswordPage();
            });

      case Routes.kRouteSignUp:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return BlocProvider(
                create: (context) => diSignUp.slSignUp<SignUpCubit>(),
                child: SignUpPage(),
              );
            });

      case Routes.kRouteAbout:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return BlocProvider(
                create: (context) => diAbout.slAbout<AboutCubit>(),
                child: AboutUs(),
              );
            });

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              return PageNotFound();
            });
    }
  }
}
