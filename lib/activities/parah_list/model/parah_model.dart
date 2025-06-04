class PrahModel {
  final int id; // ID of the Juz
  final String englishName; // English name of the Juz
  final String arabicName; // Arabic name of the Juz

  PrahModel({
    required this.id,
    required this.englishName,
    required this.arabicName,
  });
  factory PrahModel.fromMap(Map<String, dynamic> map) {
    return PrahModel(
        id: map["no"],
        englishName: map["name_english"],
        arabicName: map["name_arabic"]);
  }
}
