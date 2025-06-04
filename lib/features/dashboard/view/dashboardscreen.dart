import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/view/explore_screen.dart';
import 'package:rehman_zone/features/dashboard_content/homescreen/view/home_screem.dart';

class DashboardScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  DashboardScreen({super.key});
  final List<Widget> pages = [
    const QuranScreen(),
    const HadithContentScreeen(),
    const HomeScreen(),
    const ExploreScreen(),
    const Page5(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(),
      child: Consumer<DashboardProvider>(
        builder: (context, viewModel, child) {
          return Scaffold(
              backgroundColor: AppColors.background,
              key: scaffoldKey,
              appBar: CustomAppBar(
                title: 'Dashboard',
                leftIcon: Icons.arrow_back,
                menuIcon: Icons.menu,
                onMenuPressed: () => scaffoldKey.currentState?.openDrawer(),
                onLeftIconPressed: () {
                  // // Action for left icon
                  // Navigator.pop(context);
                },
              ),
              drawer: const CustomDrawer(),
              body: PageView(
                controller: viewModel.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
              ),
              extendBody: true,
              bottomNavigationBar: const CustomBottomNavigationBar());
        },
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(child: Text('Page 1')),
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(child: Text('No Goal Set')),
    );
  }
}
