import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0) // Use a unique typeId for this model
class BookmarkModel extends HiveObject {
  @HiveField(0)
  final int ayatId;

  @HiveField(1)
  final String arabicText;

  @HiveField(2)
  final String urduTranslation;

  BookmarkModel({
    required this.ayatId,
    required this.arabicText,
    required this.urduTranslation,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'ayatId': ayatId,
      'arabicText': arabicText,
      'urduTranslation': urduTranslation,
    };
  }

  // Create a model from a JSON map
  static BookmarkModel fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      ayatId: json['ayatId'] as int,
      arabicText: json['arabicText'] as String,
      urduTranslation: json['urduTranslation'] as String,
    );
  }
}

class BookmarkAdapter extends TypeAdapter<BookmarkModel> {
  @override
  final int typeId = 0; // Change this ID as necessary

  @override
  void write(BinaryWriter writer, BookmarkModel obj) {
    writer.writeMap(obj.toJson());
  }

  @override
  BookmarkModel read(BinaryReader reader) {
    // Read the map as a dynamic type and cast it to a Map<String, dynamic>
    Map<dynamic, dynamic> data = reader.readMap();
    return BookmarkModel.fromJson(Map<String, dynamic>.from(data));
  }
}
