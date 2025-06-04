// ignore_for_file: use_build_context_synchronously

import 'package:rehman_zone/all_imports.dart';

class SplashProvider extends ChangeNotifier {
  void navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.onboadingscreen,
        (Route<dynamic> route) => false,
      );
    });
  }
}