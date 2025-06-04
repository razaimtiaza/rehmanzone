class WaziafModel {
  final int index;
  final String urdu;
  final String english;
  final String purpose;
  final int count;

  WaziafModel(
      {required this.index,
      required this.urdu,
      required this.english,
      required this.purpose,
      required this.count});

  factory WaziafModel.fromJson(Map<String, dynamic> json) {
    return WaziafModel(
        index: json['index'],
        urdu: json['urdu'],
        english: json['english'],
        purpose: json['purpose'],
        count: json['count']);
  }
}
