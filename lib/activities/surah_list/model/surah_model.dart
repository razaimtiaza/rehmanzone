class SurahModel {
  final int id;
  final String nameEn;
  final String nameAr;
  final int ayats;
  final String place;

  SurahModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.ayats,
    required this.place,
  });

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    return SurahModel(
      id: map['id'],
      nameEn: map['name_en'],
      nameAr: map['name_ar'],
      ayats: map['ayats'],
      place: map['place'],
    );
  }
}
