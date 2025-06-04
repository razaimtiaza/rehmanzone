import 'package:rehman_zone/all_imports.dart';

class PrahLocalStorage implements PrahRepository {
  @override
  Future<List<PrahModel>> getPrah() async {
    final Database db = await DatabaseHelper.initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query('juz');

    return List.generate(maps.length, (index) {
      return PrahModel.fromMap(maps[index]);
    });
  }

  @override
  Future<List<Quran>> getQuransByPrah(int prahId) async {
    final Database db = await DatabaseHelper.initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'quran',
      where: 'paraId = ?',
      whereArgs: [prahId],
    );

    return maps.map((data) => Quran.fromMap(data)).toList();
  }
}
