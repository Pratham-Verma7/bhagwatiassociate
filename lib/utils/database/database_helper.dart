import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('bhagwati_offline.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE offline_leads (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lead_id INTEGER,
        verification_type TEXT,
        form_data TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        is_synced INTEGER DEFAULT 0
      )
    ''');
    await db.execute('''
      CREATE TABLE offline_images (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        lead_id INTEGER,
        local_path TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        is_synced INTEGER DEFAULT 0
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE offline_images (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          lead_id INTEGER,
          local_path TEXT,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          is_synced INTEGER DEFAULT 0
        )
      ''');
    }
  }

  Future<int> insertOfflineLead(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('offline_leads', data);
  }

  Future<int> insertOfflineImage(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('offline_images', data);
  }

  Future<List<Map<String, dynamic>>> getUnsyncedLeads() async {
    final db = await database;
    return await db.query(
      'offline_leads',
      where: 'is_synced = ?',
      whereArgs: [0],
    );
  }

  Future<List<Map<String, dynamic>>> getUnsyncedImages() async {
    final db = await database;
    return await db.query(
      'offline_images',
      where: 'is_synced = ?',
      whereArgs: [0],
    );
  }

  Future<void> markLeadAsSynced(int id) async {
    final db = await database;
    await db.update(
      'offline_leads',
      {'is_synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> markImageAsSynced(int id) async {
    final db = await database;
    await db.update(
      'offline_images',
      {'is_synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSyncedLead(int id) async {
    final db = await database;
    await db.delete(
      'offline_leads',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteSyncedImage(int id) async {
    final db = await database;
    await db.delete(
      'offline_images',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
