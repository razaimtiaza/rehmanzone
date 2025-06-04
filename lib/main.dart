import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rehman_zone/activities/book_mark/model/bookmark_model.dart';
import 'package:rehman_zone/all_imports.dart';
import 'package:rehman_zone/features/authentication/provider/auth_provider.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/allahname/provider/allah_name_provider.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/duas/provider/dua_provider.dart';
import 'package:rehman_zone/features/dashboard_content/explore_content/inspiration/provider/inspiration_provider.dart';
import 'package:rehman_zone/features/dashboard_content/homescreen/provider/prayer_provider.dart';
import 'package:rehman_zone/features/dashboard_content/quran_content/parah/provider/bookmark_provider.dart';
import 'package:rehman_zone/features/dashboard_content/tesbih/provider/tesbih_provider.dart';
import 'package:rehman_zone/firebase_options.dart';
import 'package:rehman_zone/service/notification/norification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.init();
  tz.initializeTimeZones();
  // await NotificationService().init();
  await DatabaseHelper.initializeDatabase();
  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkAdapter()); // Register the adapter
  await Hive.openBox<BookmarkModel>(
    'bookmarkedAyats',
  ); // Open a Hive box for bookmarks
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => QuranProvider()),
        ChangeNotifierProvider(create: (_) => SurahProvider()),
        ChangeNotifierProvider(create: (_) => PrahProvider()),
        ChangeNotifierProvider(create: (_) => HadithProvider()),
        ChangeNotifierProvider(create: (_) => ContentProvider()),
        ChangeNotifierProvider(create: (_) => GlobalTextToSpeech()),
        ChangeNotifierProvider(create: (_) => PrayerProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider(create: (_) => TasbihProvider()),
        ChangeNotifierProvider(create: (_) => AllahNameProvider()),
        ChangeNotifierProvider(create: (_) => DuaProvider()),
        ChangeNotifierProvider(create: (_) => InspirationProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticatioProvider()),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        initialRoute: AppRoutes.splashscreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
