import 'package:rehman_zone/all_imports.dart';

abstract class PrahRepository {
  Future<List<PrahModel>> getPrah();
  Future<List<Quran>> getQuransByPrah(int surahId);
}
