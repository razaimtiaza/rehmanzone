import 'package:rehman_zone/all_imports.dart';

abstract class HadithRepository {
  Future<List<HadithTopicModel>> getHadith();
}
