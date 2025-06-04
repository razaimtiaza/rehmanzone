import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';

class GlobalTextToSpeech with ChangeNotifier {
  final FlutterTts _flutterTts = FlutterTts();
  bool isPlaying = false;
  bool isArabicPlaying = false;

  Future<void> speakBoth(String arabicText, String urduText) async {
    isPlaying = true;
    notifyListeners();

    await _flutterTts.setSpeechRate(0.5); // Adjust rate as needed

    // Play Arabic Text
    await _flutterTts.setLanguage("ar"); // Arabic language
    await _flutterTts.speak(arabicText);
    isArabicPlaying = true;

    // Set a completion handler for Arabic, to trigger Urdu playback
    _flutterTts.setCompletionHandler(() async {
      if (isArabicPlaying) {
        isArabicPlaying = false;

        // Play Urdu Text
        await _flutterTts.setLanguage("ur"); // Urdu language
        await _flutterTts.speak(urduText);
      } else {
        // End of both texts
        isPlaying = false;
        notifyListeners();
      }
    });
  }

  Future<void> pause() async {
    await _flutterTts.pause();
    isPlaying = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _flutterTts.stop();
    isPlaying = false;
    isArabicPlaying = false;
    notifyListeners();
  }

  void togglePlayPause(String arabicText, String urduText) {
    if (isPlaying) {
      pause();
    } else {
      speakBoth(arabicText, urduText);
    }
  }
}
