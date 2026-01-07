import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:subtext/core/utils/logger.dart';
import 'package:subtext/data/models/analysis_record.dart';
import 'package:subtext/data/models/subtext_analysis_response.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  static Database? _database;

  static const String _databaseName = 'subtext.db';
  static const int _databaseVersion = 1;

  static const String _tableName = 'analysis_records';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    Logger.d('DatabaseService', 'Initializing database at: $path');

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    Logger.d('DatabaseService', 'Creating table: $_tableName');

    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        created_at TEXT NOT NULL,
        status TEXT NOT NULL,
        risk_score INTEGER NOT NULL,
        risk_level TEXT NOT NULL,
        core_intent TEXT NOT NULL,
        tone TEXT NOT NULL,
        psych_profile TEXT NOT NULL,
        strategies_json TEXT NOT NULL,
        cot_log_dump TEXT,
        image_path TEXT
      )
    ''');

    Logger.d('DatabaseService', 'Table created successfully');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    Logger.d('DatabaseService', 'Upgrading database from $oldVersion to $newVersion');
  }

  Future<int> insertAnalysisRecord(AnalysisRecord record) async {
    try {
      final db = await database;
      final id = await db.insert(
        _tableName,
        record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      Logger.d('DatabaseService', 'Inserted record with id: $id');
      return id;
    } catch (e) {
      Logger.e('DatabaseService', 'Error inserting record: $e');
      rethrow;
    }
  }

  Future<int> insertAnalysisFromResponse(
    SubtextAnalysisResponse response, {
    String? imagePath,
  }) async {
    try {
      final record = AnalysisRecord.fromSubtextAnalysisResponse(
        response,
        imagePath: imagePath,
      );
      return await insertAnalysisRecord(record);
    } catch (e) {
      Logger.e('DatabaseService', 'Error inserting from response: $e');
      rethrow;
    }
  }

  Future<List<AnalysisRecord>> getAllAnalysisRecords() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        orderBy: 'created_at DESC',
      );

      final records = maps.map((map) => AnalysisRecord.fromMap(map)).toList();
      Logger.d('DatabaseService', 'Retrieved ${records.length} records');
      return records;
    } catch (e) {
      Logger.e('DatabaseService', 'Error getting all records: $e');
      return [];
    }
  }

  Future<AnalysisRecord?> getAnalysisRecordById(int id) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (maps.isEmpty) return null;
      return AnalysisRecord.fromMap(maps.first);
    } catch (e) {
      Logger.e('DatabaseService', 'Error getting record by id: $e');
      return null;
    }
  }

  Future<int> updateAnalysisRecord(AnalysisRecord record) async {
    try {
      final db = await database;
      final id = record.id;
      if (id == null) {
        throw Exception('Cannot update record without id');
      }

      final count = await db.update(
        _tableName,
        record.toMap(),
        where: 'id = ?',
        whereArgs: [id],
      );
      Logger.d('DatabaseService', 'Updated $count record(s)');
      return count;
    } catch (e) {
      Logger.e('DatabaseService', 'Error updating record: $e');
      rethrow;
    }
  }

  Future<int> deleteAnalysisRecord(int id) async {
    try {
      final db = await database;
      final count = await db.delete(
        _tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
      Logger.d('DatabaseService', 'Deleted $count record(s)');
      return count;
    } catch (e) {
      Logger.e('DatabaseService', 'Error deleting record: $e');
      rethrow;
    }
  }

  Future<int> deleteAllAnalysisRecords() async {
    try {
      final db = await database;
      final count = await db.delete(_tableName);
      Logger.d('DatabaseService', 'Deleted all $count record(s)');
      return count;
    } catch (e) {
      Logger.e('DatabaseService', 'Error deleting all records: $e');
      rethrow;
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
    Logger.d('DatabaseService', 'Database closed');
  }
}