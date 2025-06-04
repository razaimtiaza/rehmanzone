import 'package:flutter/material.dart';

class ContentProvider with ChangeNotifier {
  int _currentPage = 0;
  final List<String> _pages = [];

  void initialize(String text, int maxLines) {
    _pages.clear();
    _splitTextIntoPages(text, maxLines);
    notifyListeners();
  }

  void _splitTextIntoPages(String text, int maxLines) {
    final List<String> lines = text.split('\n');
    String currentPageContent = '';

    for (var line in lines) {
      if (currentPageContent.split('\n').length < maxLines) {
        currentPageContent += (currentPageContent.isEmpty ? '' : '\n') + line;
      } else {
        _pages.add(currentPageContent);
        currentPageContent = line;
      }
    }
    if (currentPageContent.isNotEmpty) {
      _pages.add(currentPageContent);
    }
  }

  List<String> get pages => _pages;

  int get currentPage => _currentPage;

  void incrementPage() {
    if (_currentPage < _pages.length - 1) {
      _currentPage++;
      notifyListeners();
    }
  }

  void decrementPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }

  void reset() {
    _currentPage = 0;
    notifyListeners();
  }
}
