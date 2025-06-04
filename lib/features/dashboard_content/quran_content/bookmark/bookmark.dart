import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/dashboard_content/quran_content/parah/provider/bookmark_provider.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider =
        Provider.of<BookmarkProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: bookmarkProvider.bookmarkedAyats.isEmpty
          ? const Center(
              child: Text(
                'No bookmarked Ayats found.',
                style: TextStyle(color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: bookmarkProvider.bookmarkedAyats.length,
              itemBuilder: (context, index) {
                final ayat = bookmarkProvider.bookmarkedAyats[index];
                final isBookmarked = bookmarkProvider.isBookmarked(ayat.ayatId);

                return CustomContentContainer(
                  backgroundColor: AppColors.cardcolor,
                  title: ayat.arabicText,
                  subtitle: ayat.urduTranslation,
                  topIcons: [
                    IconButton(
                      onPressed: () {
                        // Action for the first button
                      },
                      icon: const Icon(
                        Icons.share,
                        color: AppColors.background,
                      ),
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
                        bookmarkProvider.toggleBookmark(context, ayat);
                      },
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color:
                            isBookmarked ? Colors.blue : AppColors.background,
                      ),
                    ),
                  ],
                  id: ayat.ayatId,
                )
                    .withPaddingTop(context.screenHeight * 0.02)
                    .withPaddingLeft(context.screenHeight * 0.02)
                    .withPaddingRight(context.screenHeight * 0.02);
              },
            ),
    );
  }
}
