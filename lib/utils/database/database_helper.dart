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
      version: 1,
      onCreate: _createDB,
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
  }

  Future<int> insertOfflineLead(Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert('offline_leads', data);
  }

  Future<List<Map<String, dynamic>>> getUnsyncedLeads() async {
    final db = await database;
    return await db.query(
      'offline_leads',
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

  Future<void> deleteSyncedLead(int id) async {
    final db = await database;
    await db.delete(
      'offline_leads',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
