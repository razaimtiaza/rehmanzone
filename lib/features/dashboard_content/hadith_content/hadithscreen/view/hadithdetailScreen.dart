// ignore_for_file: file_names

import 'package:rehman_zone/all_imports.dart';

class HadithDetailArg {
  final List<Hadith> hadith;

  HadithDetailArg({required this.hadith});
}

class HadithDetailsScreen extends StatelessWidget {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely retrieve and cast the arguments
    final arg = ModalRoute.of(context)?.settings.arguments as HadithDetailArg;

    // Check if arguments is not null and of the expected type

    // Cast safe
    // Call getAyats when the screen is built

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Consumer<HadithProvider>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.hadith.isEmpty) {
            return const Center(child: Text('No ayats available.'));
          }

          return ListView.builder(
            itemCount: arg.hadith.length,
            itemBuilder: (context, index) {
              return CustomContentContainer(
                subtitle: arg.hadith[index].arabicText,
                title: arg.hadith[index].urduTranslation,
                topIcons: [
                  IconButton(
                    onPressed: () {
                      // Action for the first button
                    },
                    icon: const Icon(
                      Icons.share,
                      color: AppColors.background,
                    ), // Replace with your desired icon
                  ),
                  IconButton(
                    onPressed: () {
                      // Action for the second button
                    },
                    icon: const Icon(
                      Icons.play_arrow_outlined,
                      color: AppColors.background,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action for the third button
                    },
                    icon: const Icon(
                      Icons.bookmark,
                      color: AppColors.background,
                    ), // Replace with your desired icon
                  ),
                ],
                id: arg.hadith[index].id,
              )
                  .withPaddingTop(context.screenHeight * 0.03)
                  .withPaddingLeft(context.screenHeight * 0.03)
                  .withPaddingRight(context.screenHeight * 0.03);
            },
          );
        },
      ),
    );
  }
}
