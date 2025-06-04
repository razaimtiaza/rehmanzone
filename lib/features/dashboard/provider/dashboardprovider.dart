import 'package:rehman_zone/all_imports.dart';

class DashboardProvider extends ChangeNotifier {
  final PageController pageController = PageController(initialPage: 2);
  final NotchBottomBarController notchController =
      NotchBottomBarController(index: 2);

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    pageController.jumpToPage(newIndex);
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
