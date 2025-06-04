import 'package:rehman_zone/activities/tasbih/model/tasbih_model.dart';
import 'package:rehman_zone/all_imports.dart';

class TasbihRepository {
  Future<List<TasbihModel>> getTasbihList() async {
    final db = await DatabaseHelper.initializeDatabase();
    List<Map<String, dynamic>> result = await db.query('tasbih');
    debugPrint("result:$result");

    return result.map((e) => TasbihModel.fromMap(e)).toList();
  }
}
