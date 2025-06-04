import 'package:rehman_zone/all_imports.dart';

class DatabaseHelper {
  static Future<Database> initializeDatabase() async {
    // Get the path to the document directory for storing the database
    var dbDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(dbDirectory.path, AppConstant.DATABASE_FILE);

    // Check if the database already exists in the directory
    var exists = await databaseExists(dbPath);

    if (!exists) {
      // If database doesn’t exist, copy it from assets
      try {
        ByteData data =
            await rootBundle.load('asset/${AppConstant.DATABASE_FILE}');
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        // Write the copied data to the database file
        await File(dbPath).writeAsBytes(bytes);
      } catch (e) {
        debugPrint('Error copying database: $e');
      }
    }

    // Open the database
    return await openDatabase(dbPath);
  }
}
