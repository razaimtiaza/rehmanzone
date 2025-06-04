// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rehman_zone/all_imports.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(
    NotificationResponse notificationResponse,
  ) async {}

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: iOSInitializationSettings,
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  static Future<void> showInstantNotification(String title, String body) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'instant_notification_channel_id',
        'Instant Notifications',
        channelDescription: 'Channel for Azan notifications',

        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound('azan'), // no .mp3
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'instant_notification',
    );
  }

  static Future<void> schedulePrayerNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    try {
      debugPrint("🕒 Scheduling: $title at $scheduledTime");

      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(scheduledTime, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'reminder_channel',
            'Reminder Channel',
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents:
            DateTimeComponents.time, // Ensures daily trigger
      );

      debugPrint("✅ Notification scheduled: $title (ID: $id)");
    } catch (e) {
      debugPrint("❌ Error scheduling $title: $e");
    }
  }

  // static Future<void> schedulePrayerNotification({
  //   required String title,
  //   required String body,
  //   required DateTime scheduledTime,
  // }) async {
  //   try {
  //     print("function is workinf");
  //     await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       title,
  //       body,
  //       tz.TZDateTime.from(scheduledTime, tz.local),
  //       const NotificationDetails(
  //         android: AndroidNotificationDetails(
  //           'reminder_channel',
  //           'Reminder Channel',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //         ),
  //       ),
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //       matchDateTimeComponents: DateTimeComponents.time,
  //     );
  //     debugPrint("Notification scheduled successfully: $title");
  //   } catch (e) {
  //     debugPrint("Error scheduling notification '$title': $e");
  //   }
  // }
}
