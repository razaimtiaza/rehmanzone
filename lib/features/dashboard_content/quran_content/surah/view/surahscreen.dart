import 'package:rehman_zone/all_imports.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SurahProvider>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel.error != null) {
          return Center(child: Text('Error: ${viewModel.error}'));
        }

        return ListView.builder(
          itemCount: viewModel.surahs.length,
          itemBuilder: (context, index) {
            final surah = viewModel.surahs[index];
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('${surah.id}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 16), // Space between ID and names
                  Expanded(
                    child: CustomText(
                      text: surah.nameEn,
                      color: AppColors.background,
                      fontSize: 16,
                    ),
                  ) // Expand to use available space
                ],
              ),
              trailing: CustomText(
                text: surah.nameAr,
                color: AppColors.background,
                fontSize: 17,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.surahdetail,
                  arguments: SurahDetailsScreenArg(
                      surah: surah), // Pass the SurahModel
                );
              }, // Arabic name as subtitle
            );
          },
        );
      },
    );
  }
}
