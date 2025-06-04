class Hadith {
  final int id;
  final String arabicText;
  final String englishTranslation;
  final String urduTranslation;
  final String narrator;

  Hadith({
    required this.id,
    required this.arabicText,
    required this.englishTranslation,
    required this.urduTranslation,
    required this.narrator,
  });

  // Factory method to create a Hadith from JSON
  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      id: json['id'],
      arabicText: json['arabicText'],
      englishTranslation: json['englishTranslation'],
      urduTranslation: json['urduTranslation'],
      narrator: json['narrator'],
    );
  }

  // Method to convert Hadith to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicText': arabicText,
      'englishTranslation': englishTranslation,
      'urduTranslation': urduTranslation,
      'narrator': narrator,
    };
  }
}

class HadithTopicModel {
  final String topic;

  final List<Hadith> hadiths;

  HadithTopicModel({
    required this.topic,
    required this.hadiths,
  });

  factory HadithTopicModel.fromJson(Map<String, dynamic> json) {
    var hadithList = json['hadiths'] as List;
    List<Hadith> hadithItems =
        hadithList.map((i) => Hadith.fromJson(i)).toList();
    return HadithTopicModel(
      topic: json['topic'],
      hadiths: hadithItems,
    );
  }
}
