class AllahNameModel {
  final String arabic;
  final String englishName;
  final String urduMeaning;
  final String englishMeaning;
  final String englishExplantion;
  AllahNameModel(
      {required this.arabic,
      required this.englishName,
      required this.urduMeaning,
      required this.englishMeaning,
      required this.englishExplantion});

  factory AllahNameModel.fromMap(Map<String, dynamic> map) {
    return AllahNameModel(
        arabic: map['arabic'] ?? "",
        englishName: map['english'] ?? "",
        urduMeaning: map['urduMeaning'] ?? "",
        englishMeaning: map['englishMeaning'] ?? "",
        englishExplantion: map['englishExplanation'] ?? "");
  }
}
