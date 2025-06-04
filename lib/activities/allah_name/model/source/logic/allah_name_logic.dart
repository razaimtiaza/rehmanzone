import 'package:rehman_zone/activities/allah_name/model/allah_name_model.dart';

import 'package:rehman_zone/all_imports.dart';

class AllahNameRepository {
  Future<List<AllahNameModel>> getTasbihList() async {
    final db = await DatabaseHelper.initializeDatabase();
    List<Map<String, dynamic>> result = await db.query('allah_names');

    return result.map((e) => AllahNameModel.fromMap(e)).toList();
  }
}
