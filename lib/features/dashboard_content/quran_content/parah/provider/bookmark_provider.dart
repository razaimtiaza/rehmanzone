import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart';
import 'package:rehman_zone/activities/book_mark/model/bookmark_model.dart';

class BookmarkProvider with ChangeNotifier {
  final Box<BookmarkModel> _bookmarkedAyatsBox =
      Hive.box<BookmarkModel>('bookmarkedAyats');

  // Check if an Ayat is bookmarked
  bool isBookmarked(int ayatId) {
    return _bookmarkedAyatsBox.containsKey(ayatId);
  }

  // Toggle bookmark
  void toggleBookmark(BuildContext context, BookmarkModel ayat) {
    if (isBookmarked(ayat.ayatId)) {
      _bookmarkedAyatsBox.delete(ayat.ayatId);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Bookmark removed"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      _bookmarkedAyatsBox.put(ayat.ayatId, ayat);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Bookmark added"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    }
    notifyListeners();
  }

  // Get all bookmarked Ayats
  List<BookmarkModel> get bookmarkedAyats {
    return _bookmarkedAyatsBox.values.toList();
  }
}
