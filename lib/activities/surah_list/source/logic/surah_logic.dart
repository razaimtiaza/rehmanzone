import 'package:rehman_zone/all_imports.dart';

class SurahLocalStorage implements SurahRepository {
  @override
  Future<List<SurahModel>> getAll() async {
    final Database db = await DatabaseHelper.initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('surah');

    return List.generate(maps.length, (index) {
      return SurahModel.fromMap(maps[index]);
    });
  }

  @override
  Future<List<Quran>> getQuransBySurah(int surahId) async {
    final Database db = await DatabaseHelper.initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'quran',
      where: 'surahId = ?',
      whereArgs: [surahId],
    );

    return maps.map((data) => Quran.fromMap(data)).toList();
  }
}
