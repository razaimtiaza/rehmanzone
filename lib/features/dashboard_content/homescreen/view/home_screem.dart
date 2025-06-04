import "package:rehman_zone/all_imports.dart";

import "package:rehman_zone/features/dashboard_content/homescreen/widget/coustom_card.dart";
import "package:rehman_zone/features/dashboard_content/homescreen/widget/todaygoal.dart";
import "package:rehman_zone/features/dashboard_content/homescreen/widget/transprant_cont.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TransparentContainerExample(),
            twoContanir(context),
            coustomContair(context),
            const TodaysGoalWidget(),
          ],
        ),
      ),
    );
  }

  Widget twoContanir(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.loginscreen);
          },
          child: Container(
            width: 167,
            height: 66,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('asset/images/quranicon.png'),
                const Text(
                  "Community",
                  style: TextStyle(color: AppColors.background, fontSize: 14),
                ),
              ],
            ),
          ),
        ),

        Container(
          width: 167,
          height: 66,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('asset/images/storytime.png'),
              const Text(
                "Story Time",
                style: TextStyle(color: AppColors.background, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ).withPaddingTop(20);
  }

  Widget coustomContair(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomCardWidget(
          imagePath: 'asset/images/praying.png',
          title: "How to\n pray",
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.tesbihcounter);
          },
          child: CustomCardWidget(
            imagePath: 'asset/images/tashbih.png',
            title: "Tasbih\n Counter",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.qiblahdirection);
          },
          child: CustomCardWidget(
            imagePath: 'asset/images/kaaba.png',
            title: "Qiblah\n Direction",
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.islamicHijriCalendar);
          },
          child: CustomCardWidget(
            imagePath: 'asset/images/calender.png',
            title: "Islamic\n Calender",
          ),
        ),
      ],
    ).withPaddingTop(20).withPaddingLeft(10).withPaddingRight(10);
  }
}
