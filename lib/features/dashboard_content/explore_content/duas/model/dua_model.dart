class DuaModel {
  final int index;
  final String name;
  final String english;
  final String arabic;

  DuaModel({
    required this.index,
    required this.name,
    required this.english,
    required this.arabic,
  });

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      index: json['index'],
      name: json['name'],
      english: json['english'],
      arabic: json['arabic'],
    );
  }
}
