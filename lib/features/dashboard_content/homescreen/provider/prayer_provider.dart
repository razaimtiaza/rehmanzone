import 'package:flutter/material.dart';
import 'package:rehman_zone/activities/fetch_namz_time/model/fetch_namz_time.dart';
import 'package:rehman_zone/activities/fetch_namz_time/source/logic/fetch_namz_service.dart';
import 'dart:async';

import 'package:rehman_zone/service/notification/norification_service.dart';

// class PrayerProvider with ChangeNotifier {
//   PrayerModel? prayerModel;
//   String? nextPrayer;
//   String? remainingTime;
//   Timer? timer;
//   PrayerProvider() {
//     fetchPrayerTimings();
//   }
//   Future<void> fetchPrayerTimings() async {
//     PrayerService service = PrayerService();
//     prayerModel = await service.getPrayerTimings();
//     debugPrint("Prayer timings fetched: ");

//     // Schedule notifications once
//     schedulePrayerNotifications();
//     findNextPrayer();
//     startTimer();
//     // notifyListeners();
//   }

//   void schedulePrayerNotifications() {
//     if (prayerModel == null) return;

//     Map<String, String> prayerTimes = {
//       "Fajr": prayerModel!.fajr,
//       "Dhuhr": prayerModel!.dhuhr,
//       "Asr": prayerModel!.asr,
//       "Maghrib": prayerModel!.maghrib,
//       "Isha": prayerModel!.isha,
//     };

//     int idCounter = 1; // Unique ID per prayer

//     prayerTimes.forEach((name, time) async {
//       DateTime prayerTime = _convertTimeToDateTime(time);

//       if (prayerTime.isAfter(DateTime.now())) {
//         await NotificationService.schedulePrayerNotification(
//           id: idCounter, // Unique ID
//           title: "$name Prayer Time",
//           body: "It's time for $name prayer.",
//           scheduledTime: prayerTime,
//         );
//         debugPrint(
//           "✅ Scheduled $name prayer at $prayerTime with ID: $idCounter",
//         );
//       } else {
//         debugPrint("⏩ Skipped $name, time already passed: $prayerTime");
//       }

//       idCounter++;
//     });
//   }

//   // void schedulePrayerNotifications() {
//   //   if (prayerModel == null) return;

//   //   Map<String, String> prayerTimes = {
//   //     "Fajr": prayerModel!.fajr,
//   //     "Dhuhr": prayerModel!.dhuhr,
//   //     "Asr": prayerModel!.asr,
//   //     "Maghrib": prayerModel!.maghrib,
//   //     "Isha": prayerModel!.isha,
//   //   };

//   //   prayerTimes.forEach((name, time) async {
//   //     DateTime prayerTime = _convertTimeToDateTime(time);

//   //     // Check if prayer time is in future
//   //     if (prayerTime.isAfter(DateTime.now())) {
//   //       await NotificationService.schedulePrayerNotification(
//   //         title: "$name Prayer Time",
//   //         body: "It's time for $name prayer.",
//   //         scheduledTime: prayerTime,
//   //       );
//   //       debugPrint("Scheduled $name prayer at $prayerTime");
//   //     } else {
//   //       debugPrint("Skipped $name prayer, time already passed: $prayerTime");
//   //     }
//   //   });
//   // }

//   void findNextPrayer() {
//     if (prayerModel == null) return;

//     Map<String, String> prayerTimes = {
//       "Fajr": prayerModel!.fajr,
//       "Dhuhr": prayerModel!.dhuhr,
//       "Asr": prayerModel!.asr,
//       "Maghrib": prayerModel!.maghrib,
//       "Isha": prayerModel!.isha,
//     };

//     DateTime now = DateTime.now();
//     nextPrayer = null;
//     remainingTime = null;

//     prayerTimes.forEach((name, time) {
//       DateTime prayerTime = _convertTimeToDateTime(time);
//       if (prayerTime.isAfter(now) &&
//           (nextPrayer == null ||
//               prayerTime.isBefore(
//                 _convertTimeToDateTime(prayerTimes[nextPrayer!]!),
//               ))) {
//         nextPrayer = name;
//         remainingTime = _calculateRemainingTime(prayerTime);
//       }
//     });

//     notifyListeners();
//   }

//   DateTime _convertTimeToDateTime(String time) {
//     final now = DateTime.now();
//     final parts = time.split(":");
//     final hour = int.parse(parts[0]);
//     final minute = int.parse(parts[1]);

//     return DateTime(now.year, now.month, now.day, hour, minute);
//   }

//   String _calculateRemainingTime(DateTime prayerTime) {
//     Duration diff = prayerTime.difference(DateTime.now());
//     int hours = diff.inHours;
//     int minutes = diff.inMinutes.remainder(60);
//     return "${hours}h ${minutes}m left";
//   }

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (nextPrayer != null) {
//         findNextPrayer();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
// }

class PrayerProvider with ChangeNotifier {
  PrayerModel? prayerModel;
  String? nextPrayer;
  String? remainingTime;
  Timer? timer;

  // New: Track which prayer notification has been sent
  Map<String, bool> notifiedPrayers = {
    "Fajr": false,
    "Dhuhr": false,
    "Asr": false,
    "Maghrib": false,
    "Isha": false,
  };

  DateTime? lastCheckedDay;

  PrayerProvider() {
    fetchPrayerTimings();
  }

  Future<void> fetchPrayerTimings() async {
    PrayerService service = PrayerService();
    prayerModel = await service.getPrayerTimings();
    findNextPrayer();
    startTimer();
  }

  void findNextPrayer() {
    if (prayerModel == null) return;

    Map<String, String> prayerTimes = {
      "Fajr": prayerModel!.fajr,
      "Dhuhr": prayerModel!.dhuhr,
      "Asr": prayerModel!.asr,
      "Maghrib": prayerModel!.maghrib,
      "Isha": prayerModel!.isha,
    };

    DateTime now = DateTime.now();
    nextPrayer = null;
    remainingTime = null;

    prayerTimes.forEach((name, time) {
      DateTime prayerTime = _convertTimeToDateTime(time);
      if (prayerTime.isAfter(now) &&
          (nextPrayer == null ||
              prayerTime.isBefore(
                _convertTimeToDateTime(prayerTimes[nextPrayer!]!),
              ))) {
        nextPrayer = name;
        remainingTime = _calculateRemainingTime(prayerTime);
      }
    });

    notifyListeners();
  }

  DateTime _convertTimeToDateTime(String time) {
    final now = DateTime.now();
    final parts = time.split(":");
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return DateTime(now.year, now.month, now.day, hour, minute);
  }

  String _calculateRemainingTime(DateTime prayerTime) {
    Duration diff = prayerTime.difference(DateTime.now());
    int hours = diff.inHours;
    int minutes = diff.inMinutes.remainder(60);
    return "${hours}h ${minutes}m left";
  }

  void startTimer() {
    lastCheckedDay = DateTime.now();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      findNextPrayer();
      _checkAndNotifyPrayer();

      // Reset flags if a new day starts
      final now = DateTime.now();
      if (lastCheckedDay!.day != now.day) {
        notifiedPrayers.updateAll((key, value) => false);
        lastCheckedDay = now;
        debugPrint("🔄 Reset notification flags for new day");
      }
    });
  }

  void _checkAndNotifyPrayer() {
    if (prayerModel == null) return;

    Map<String, String> prayerTimes = {
      "Fajr": prayerModel!.fajr,
      "Dhuhr": prayerModel!.dhuhr,
      "Asr": prayerModel!.asr,
      "Maghrib": prayerModel!.maghrib,
      "Isha": prayerModel!.isha,
    };

    final now = DateTime.now();

    prayerTimes.forEach((name, time) {
      final prayerTime = _convertTimeToDateTime(time);

      if (now.hour == prayerTime.hour &&
          now.minute == prayerTime.minute &&
          !notifiedPrayers[name]!) {
        // Trigger notification
        NotificationService.showInstantNotification(
          "$name Prayer Time",
          "It's time for $name prayer.",
        );
        debugPrint("📣 Notification triggered for $name at $prayerTime");

        // Mark this prayer as notified
        notifiedPrayers[name] = true;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}


// void findNextPrayer() {
  //   if (prayerModel == null) return;

  //   Map<String, String> prayerTimes = {
  //     "Fajr": prayerModel!.fajr,
  //     "Dhuhr": prayerModel!.dhuhr,
  //     "Asr": prayerModel!.asr,
  //     "Maghrib": prayerModel!.maghrib,
  //     "Isha": prayerModel!.isha,
  //   };

  //   DateTime now = DateTime.now();
  //   nextPrayer = null;
  //   remainingTime = null;

  //   prayerTimes.forEach((name, time) {
  //     DateTime prayerTime = _convertTimeToDateTime(time);
  //     if (prayerTime.isAfter(now) &&
  //         (nextPrayer == null ||
  //             prayerTime.isBefore(
  //               _convertTimeToDateTime(prayerTimes[nextPrayer!]!),
  //             ))) {
  //       print("object");
  //       nextPrayer = name;
  //       remainingTime = _calculateRemainingTime(prayerTime);

  //       // Schedule notification for the next prayer
  //       NotificationService.schedulePrayerNotification(
  //         title: "Time for $name Prayer",
  //         body: "It's time to perform your $name prayer.",
  //         scheduledTime: prayerTime,
  //       );
  //       print("prayer time:$prayerTime");
  //     }
  //   });
  //   print("next paryer time:$nextPrayer");

  //   notifyListeners();
  // }

  // void findNextPrayer() {
  //   if (prayerModel == null) return;

  //   Map<String, String> prayerTimes = {
  //     "Fajr": prayerModel!.fajr,
  //     "Dhuhr": prayerModel!.dhuhr,
  //     "Asr": prayerModel!.asr,
  //     "Maghrib": prayerModel!.maghrib,
  //     "Isha": prayerModel!.isha,
  //   };

  //   DateTime now = DateTime.now();
  //   nextPrayer = null;
  //   remainingTime = null;

  //   prayerTimes.forEach((name, time) {
  //     DateTime prayerTime = _convertTimeToDateTime(time);
  //     if (prayerTime.isAfter(now) &&
  //         (nextPrayer == null ||
  //             prayerTime.isBefore(
  //               _convertTimeToDateTime(prayerTimes[nextPrayer!]!),
  //             ))) {
  //       nextPrayer = name;

  //       // Schedule notification here
  //       // NotificationService.schedulePrayerNotification(
  //       //   title: "Prayer Time",
  //       //   body: "It's time for $name prayer.",
  //       //   scheduledTime: prayerTime,
  //       // );
  //     }
  //   });

  //   notifyListeners();
  // }
// import 'package:flutter/material.dart';
// import 'package:rehman_zone/activities/fetch_namz_time/model/fetch_namz_time.dart';
// import 'package:rehman_zone/activities/fetch_namz_time/source/logic/fetch_namz_service.dart';
// import 'dart:async';
// import 'package:intl/intl.dart';
// import 'package:rehman_zone/service/notification/norification_service.dart';
// // Make sure this is your notification class

// class PrayerProvider with ChangeNotifier {
//   PrayerModel? prayerModel;
//   String? nextPrayer;
//   String? remainingTime;
//   Timer? timer;
//   Set<String> notifiedPrayers = {};

//   PrayerProvider() {
//     fetchPrayerTimings();
//   }

//   Future<void> fetchPrayerTimings() async {
//     PrayerService service = PrayerService();
//     prayerModel = await service.getPrayerTimings();
//     findNextPrayerAndNotify(); // updated method
//     startTimer();
//   }

//   void findNextPrayerAndNotify() {
//     if (prayerModel == null) return;

//     Map<String, String> prayerTimes = {
//       "Fajr": prayerModel!.fajr,
//       "Dhuhr": prayerModel!.dhuhr,
//       "Asr": prayerModel!.asr,
//       "Maghrib": prayerModel!.maghrib,
//       "Isha": prayerModel!.isha,
//     };

//     DateTime now = DateTime.now();
//     nextPrayer = null;
//     remainingTime = null;

//     for (var entry in prayerTimes.entries) {
//       DateTime prayerTime = _convertTimeToDateTime(entry.value);
//       if (prayerTime.isAfter(now)) {
//         nextPrayer = entry.key;
//         remainingTime = _calculateRemainingTime(prayerTime);

//         // Only notify once per prayer
//         if (!notifiedPrayers.contains(entry.key) &&
//             prayerTime.difference(now).inSeconds <= 60) {
//           _scheduleAzanNotification(entry.key);
//           notifiedPrayers.add(entry.key);
//         }

//         break;
//       }
//     }

//     notifyListeners();
//   }

//   DateTime _convertTimeToDateTime(String time) {
//     DateTime now = DateTime.now();
//     DateTime dateTime = DateFormat("HH:mm").parse(time);
//     return DateTime(
//       now.year,
//       now.month,
//       now.day,
//       dateTime.hour,
//       dateTime.minute,
//     );
//   }

//   String _calculateRemainingTime(DateTime prayerTime) {
//     Duration diff = prayerTime.difference(DateTime.now());
//     int hours = diff.inHours;
//     int minutes = diff.inMinutes.remainder(60);
//     return "${hours}h ${minutes}m left";
//   }

//   void _scheduleAzanNotification(String prayerName) {
//     NotificationService.showAzanNotification(
//       "$prayerName Time",
//       "It's time for $prayerName. Please offer your Salah.",
//     );
//   }

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (nextPrayer != null) {
//         findNextPrayerAndNotify();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
// }
