class InspirationModel {
  final String english;
  final String urdu;
  final String sournce;

  InspirationModel({
    required this.english,
    required this.urdu,
    required this.sournce,
  });

  factory InspirationModel.fromJson(Map<String, dynamic> json) {
    return InspirationModel(
        english: json['english'], urdu: json['urdu'], sournce: json['source']);
  }
}
