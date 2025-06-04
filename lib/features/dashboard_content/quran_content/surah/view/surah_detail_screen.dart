import 'package:rehman_zone/activities/book_mark/model/bookmark_model.dart';
import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/quran_content/parah/provider/bookmark_provider.dart';

class SurahDetailsScreenArg {
  SurahModel surah;
  SurahDetailsScreenArg({required this.surah});
}

class SurahDetailsScreen extends StatelessWidget {
  const SurahDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Safely retrieve and cast the arguments
    final arguments =
        ModalRoute.of(context)?.settings.arguments as SurahDetailsScreenArg;

    // Check if arguments is not null and of the expected type
    // if (arguments is! SurahDetailsScreenArg) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Error'),
    //     ),
    //     body: const Center(child: Text('Surah data is missing.')),
    //   );
    // }

    // Cast safely
    final provider = Provider.of<SurahProvider>(context, listen: false);
    final tts = Provider.of<GlobalTextToSpeech>(context);

    // Fetch the Ayats based on the Surah ID
    provider.getAyats(arguments.surah.id);
    // Call getAyats when the screen is built

    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.surah.nameAr),
        ),
        body: Consumer<SurahProvider>(
          builder: (context, viewModel, child) {
            if (viewModel.ayatsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (viewModel.ayatsError != null) {
              return Center(child: Text('Error: ${viewModel.ayatsError}'));
            }
            if (viewModel.ayats.isEmpty) {
              return const Center(child: Text('No ayats available.'));
            }
            final bookmarkProvider =
                Provider.of<BookmarkProvider>(context, listen: true);
            return ListView.builder(
              itemCount: viewModel.ayats.length,
              itemBuilder: (context, index) {
                final ayat = viewModel.ayats[index];
                final isBookmarked = bookmarkProvider.isBookmarked(ayat.ayatId);

                final isCurrentlyPlaying = tts.isPlaying;
                return CustomContentContainer(
                  title: ayat.arabicText, subtitle: ayat.urduTranslation,
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
                        tts.togglePlayPause(
                            ayat.arabicText, ayat.urduTranslation);
                      },
                      icon: Icon(
                        isCurrentlyPlaying
                            ? Icons.pause
                            : Icons.play_arrow_outlined,
                        color: AppColors.background,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        bookmarkProvider.toggleBookmark(
                            context,
                            BookmarkModel(
                              ayatId: ayat.ayatId,
                              arabicText: ayat.arabicText,
                              urduTranslation: ayat.urduTranslation,
                            ));
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color:
                            isBookmarked ? Colors.blue : AppColors.background,
                      ),
                    ),
                  ],
                  id: ayat.ayatId,

                  // Display Urdu translation
                )
                    .withPaddingTop(context.screenHeight * 0.02)
                    .withPaddingLeft(context.screenHeight * 0.02)
                    .withPaddingRight(context.screenHeight * 0.02);
              },
            );
          },
        ));
  }
}
