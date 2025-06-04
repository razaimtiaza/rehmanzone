import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/homescreen/provider/prayer_provider.dart';

class TransparentContainerExample extends StatelessWidget {
  const TransparentContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final homeProvider = Provider.of<PrayerProvider>(context);

    // homeProvider.fetchPrayerTimings();
    if (homeProvider.prayerModel == null) {
      return const CircularProgressIndicator();
    }

    return Center(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.4,
        decoration: BoxDecoration(
          color: const Color(0x48FFFFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "AssalamuAlaikum",
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // 4.5% of screen width
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).withPaddingTop(20),
            Center(
              child: Text(
                "فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ",
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // 4.5% of screen width
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: Text(
                "Then which of the favors of your Lord will you deny?",
                style: TextStyle(
                  fontSize: screenWidth * 0.03, // 3% of screen width
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                homeProvider.nextPrayer != null
                    ? homeProvider.prayerModel!
                        .getPrayerTime(homeProvider.nextPrayer!)
                    : "No Prayer Left",
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // 5% of screen width
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                homeProvider.remainingTime ?? "",
                style: TextStyle(
                  fontSize: screenWidth * 0.0375, // 3.75% of screen width
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrayerWidget(
                    prayerName: "Fajr",
                    prayerTime: homeProvider.prayerModel!.fajr,
                    image: Icons.sunny,
                    screenWidth: screenWidth,
                  ),
                  PrayerWidget(
                    prayerName: "Dhuhr",
                    prayerTime: homeProvider.prayerModel!.dhuhr,
                    image: Icons.sunny_snowing,
                    screenWidth: screenWidth,
                  ),
                  PrayerWidget(
                    prayerName: "Asr",
                    prayerTime: homeProvider.prayerModel!.asr,
                    image: Icons.cloud,
                    screenWidth: screenWidth,
                  ),
                  PrayerWidget(
                    prayerName: "Maghrib",
                    prayerTime: homeProvider.prayerModel!.maghrib,
                    image: Icons.nightlight,
                    screenWidth: screenWidth,
                  ),
                  PrayerWidget(
                    prayerName: "Isha",
                    prayerTime: homeProvider.prayerModel!.isha,
                    image: Icons.brightness_3,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PrayerWidget extends StatelessWidget {
  final String prayerName;
  final String prayerTime;

  final IconData image;
  final double screenWidth;

  const PrayerWidget({
    super.key,
    required this.prayerName,
    required this.prayerTime,
    required this.image,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prayerName,
          style: TextStyle(
            fontSize: screenWidth * 0.04, // 4% of screen width
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Icon(
          image,
          size: screenWidth * 0.1, // 10% of screen width
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          prayerTime,
          style: TextStyle(
            fontSize: screenWidth * 0.035, // 3.5% of screen width
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
