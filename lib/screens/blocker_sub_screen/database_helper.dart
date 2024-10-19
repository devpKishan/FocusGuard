import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'blocked_apps.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE blocked_apps(id INTEGER PRIMARY KEY AUTOINCREMENT, package_name TEXT)',
        );
      },
    );
  }

  Future<void> insertBlockedApp(String packageName) async {
    final db = await database;
    await db.insert(
      'blocked_apps',
      {'package_name': packageName},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<String>> getBlockedApps() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('blocked_apps');

    return List.generate(maps.length, (i) {
      return maps[i]['package_name'] as String;
    });
  }
}
