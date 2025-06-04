import 'package:rehman_zone/all_imports.dart';

class OnboadingScreen extends StatelessWidget {
  const OnboadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoneBoard(
        pageController: PageController(initialPage: 0),
        onFinishedPage: DashboardScreen(),
        items: [
          GonePage(
            context: context,
            image: AppImages.onboading1,
            text: 'Discover Islamic Knowledge',
            color: Colors.amberAccent,
            text2: 'Access the Quran, Hadith, daily prayers, and more.',
          ),
          GonePage(
            context: context,
            image: AppImages.onboading2,
            text: 'Track Your Prayers',
            color: Colors.black,
            text2:
                'Get prayer times, set reminders, and record missed prayers. ',
          ),
          GonePage(
            context: context,
            image: AppImages.onboading3,
            text: 'Explore Duas and Wazaif',
            color: Colors.black,
            text2: 'Find the right supplications for every need.',
          ),
        ],
      ),
    );
  }
}
