import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/authentication/loginscreen/view/loginscreen.dart';
import 'package:rehman_zone/features/authentication/register/view/register_screen.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/allahname/view/allah_name_screen.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/duas/view/dua_screen.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/inspiration/view/inspiration_screen.dart';
import 'package:rehman_zone/features/dashboard_content/islamic_calender/view/islamic_clander_screen.dart';

import 'package:rehman_zone/features/dashboard_content/qiblah/view/qiblah_screen.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/view/tesbih_detailscreen.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/view/tesbih_screen.dart';

class AppRoutes {
  static const String splashscreen = "/splashscreen";
  static const String onboadingscreen = "/onboadingscreen";
  static const String dashboard = "/dashboardscreen";
  static const String surahdetail = "/surahdetail";
  static const String hadithdetail = "/hadithdetail";
  static const String prahdetail = "/prahdetail";
  static const String qiblahdirection = "/qiblahdirection";
  static const String tesbihcounter = "/tesbihcounter";
  static const String tesbihdetailscreen = "/tesbihdetailscreen";
  static const String allahnamescreen = "/allahnamescreen";
  static const String duascreen = "/duascreen";
  static const String inspirationscreen = "/inspirationscreen";
  static const String islamicHijriCalendar = "/islamicclender";
  static const String loginscreen = "/loginscreen";
  static const String registerscreen = "/register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboadingscreen:
        return MaterialPageRoute(builder: (_) => const OnboadingScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case qiblahdirection:
        return MaterialPageRoute(builder: (_) => QiblahScreen());
      case tesbihcounter:
        return MaterialPageRoute(
          builder: (_) => TesbihScreen(),
          settings: settings,
        );
      case surahdetail:
        return MaterialPageRoute(
          builder: (_) => const SurahDetailsScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case tesbihdetailscreen:
        return MaterialPageRoute(
          builder: (_) => TesbihDetailscreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case prahdetail:
        return MaterialPageRoute(
          builder: (_) => const PrahDetailScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case hadithdetail:
        return MaterialPageRoute(
          builder: (_) => const HadithDetailsScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case allahnamescreen:
        return MaterialPageRoute(
          builder: (_) => const AllahNameScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case duascreen:
        return MaterialPageRoute(
          builder: (_) => const DuaScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case inspirationscreen:
        return MaterialPageRoute(
          builder: (_) => const InspirationScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case islamicHijriCalendar:
        return MaterialPageRoute(
          builder: (_) => const HijriCalendarExample(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case loginscreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      case registerscreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings:
              settings, // No need to pass args here as it's handled in the screen.
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('No route defined for')),
          ),
    );
  }
}
