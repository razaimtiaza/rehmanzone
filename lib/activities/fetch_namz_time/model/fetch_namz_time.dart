class PrayerModel {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerModel({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
  String getPrayerTime(String prayerName) {
    switch (prayerName) {
      case "Fajr":
        return fajr;
      case "Dhuhr":
        return dhuhr;
      case "Asr":
        return asr;
      case "Maghrib":
        return maghrib;
      case "Isha":
        return isha;
      default:
        return "";
    }
  }
}
