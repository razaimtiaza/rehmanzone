class Quran {
  final int ayatId;
  final int ayatNumber;
  final String arabicText;
  final String urduTranslation;
  final int ayatSajda;
  final int surahRuku;
  final int paraRuku;
  final int paraId;
  final int manzilNo;
  final int ayatVisible;
  final int surahId;
  final String withoutAerab;
  final int favorite;

  Quran({
    required this.ayatId,
    required this.ayatNumber,
    required this.arabicText,
    required this.urduTranslation,
    required this.ayatSajda,
    required this.surahRuku,
    required this.paraRuku,
    required this.paraId,
    required this.manzilNo,
    required this.ayatVisible,
    required this.surahId,
    required this.withoutAerab,
    required this.favorite,
  });

  // Factory method to create a Quran instance from a map
  factory Quran.fromMap(Map<String, dynamic> data) {
    return Quran(
      ayatId: data['ayatId'] as int,
      ayatNumber: data['ayatNumber'] as int,
      arabicText: data['arabicText'].toString(),
      urduTranslation: data['urduTranslation'].toString(),
      ayatSajda: data['ayatSajda'] as int,
      surahRuku: data['surahRuku'] as int,
      paraRuku: data['paraRuku'] as int,
      paraId: data['paraId'] as int,
      manzilNo: data['manzilNo'] as int,
      ayatVisible: data['ayatVisible'] as int,
      surahId: data['surahId'] as int,
      withoutAerab: data['withoutAerab'].toString(),
      favorite: int.tryParse(data['favourite'].toString()) ?? 0,
    );
  }

  // Convert a Quran instance to a map
  Map<String, dynamic> toMap() {
    return {
      'ayatId': ayatId,
      'ayatNumber': ayatNumber,
      'arabicText': arabicText,
      'urduTranslation': urduTranslation,
      'ayatSajda': ayatSajda,
      'surahRuku': surahRuku,
      'paraRuku': paraRuku,
      'paraId': paraId,
      'manzilNo': manzilNo,
      'ayatVisible': ayatVisible,
      'surahId': surahId,
      'withoutAerab': withoutAerab,
      'favorite': favorite,
    };
  }
}
