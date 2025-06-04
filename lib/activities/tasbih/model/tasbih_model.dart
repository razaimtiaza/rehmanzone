class TasbihModel {
  final int id;
  final String tasbihname;
  final int counter;

  TasbihModel({
    required this.id,
    required this.tasbihname,
    required this.counter,
  });

  // Convert from Map to Model
  factory TasbihModel.fromMap(Map<String, dynamic> map) {
    return TasbihModel(
      id: map['id'],
      tasbihname: map['name'] ?? '', // If null, assign empty string
      counter: map['counter'] ?? 0, // If null, assign 0
    );
  }
}
