import 'package:rehman_zone/all_imports.dart';

// ignore: camel_case_types
class hadithLocalStorage implements HadithRepository {
  @override
  Future<List<HadithTopicModel>> getHadith() async {
    final String response = await rootBundle.loadString('asset/hadith.json');
    final data = json.decode(response) as Map<String, dynamic>;
    var topicsList = data['topics'] as List;
    return topicsList.map((topic) => HadithTopicModel.fromJson(topic)).toList();
  }
}
