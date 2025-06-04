import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/quran_content/bookmark/bookmark.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  final List<Widget> _tabs = const [
    SurahScreen(),
    PrahScreen(),
    Bookmark(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  width: 359,
                  height: 178,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppColors.background),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "Last Read",
                            color: Colors.white,
                          ),
                          const CustomText(
                            text: "ةحتافلا",
                            color: Colors.white,
                          ).withPaddingTop(20),
                          const CustomText(
                            text: "Ayah no. 1 - Ayah no. 10",
                            color: Colors.white,
                          ).withPaddingTop(20).withPaddingLeft(10),
                        ],
                      ),
                      Image.asset("asset/images/cardimage.png")
                          .withPaddingRight(10)
                    ],
                  ),
                ).withPaddingAll(20),
                const TabBar(
                  tabs: [
                    Tab(text: "Surah"),
                    Tab(text: "Parah"),
                    Tab(text: "BookMark"),
                  ],
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: _tabs,
              ),
            )
          ],
        ),
      ),
    );
  }
}

  // Container(
  //             width: 359,
  //             height: 178,
  //             decoration: BoxDecoration(
  //                 shape: BoxShape.rectangle,
  //                 borderRadius: BorderRadius.all(Radius.circular(15)),
  //                 color: AppColors.background),
  //           ),