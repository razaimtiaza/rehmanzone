import 'package:rehman_zone/all_imports.dart';

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get paddingTop => MediaQuery.of(this).padding.top;

  double get paddingBottom => MediaQuery.of(this).padding.bottom;

  double get paddingLeft => MediaQuery.of(this).padding.left;

  double get paddingRight => MediaQuery.of(this).padding.right;
}
