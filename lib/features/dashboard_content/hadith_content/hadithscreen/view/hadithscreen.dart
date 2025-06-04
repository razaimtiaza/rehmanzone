import 'package:rehman_zone/all_imports.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HadithProvider>(
      builder: (context, hadithProvider, child) {
        if (hadithProvider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: hadithProvider
              .hadith.length, // This should return the number of topics
          itemBuilder: (context, index) {
            final topic = hadithProvider.hadith[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.hadithdetail,
                  arguments: HadithDetailArg(
                    hadith: topic.hadiths,
                  ), // Pass the SurahModel
                );
              },
              child: Card(
                color: AppColors.primary,
                elevation: 4,
                child: Center(
                  child: CustomText(
                    text: topic.topic,
                    color:
                        AppColors.background, // Correctly accessing topic name
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
