import 'package:http/http.dart' as http;
import 'package:rehman_zone/activities/fetch_namz_time/model/fetch_namz_time.dart';
import 'package:rehman_zone/all_imports.dart';

class PrayerService {
  Future<PrayerModel?> getPrayerTimings() async {
    String url =
        "https://api.aladhan.com/v1/timingsByCity?city=Lahore&country=Pakistan&method=2";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        return PrayerModel.fromJson(data['data']['timings']);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("API Error: $e");
      return null;
    }
  }
}
