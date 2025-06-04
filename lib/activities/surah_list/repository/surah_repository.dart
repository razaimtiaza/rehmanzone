import 'package:rehman_zone/all_imports.dart';

abstract class SurahRepository {
  Future<List<SurahModel>> getAll();
  Future<List<Quran>> getQuransBySurah(int surahId);
}
