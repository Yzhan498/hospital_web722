import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static const _databaseName = "app.db";
  static const _databaseVersion = 1;

  DatabaseHelper._internal();
  static final DatabaseHelper databaseHelper = DatabaseHelper._internal();
  static DatabaseHelper get instance => databaseHelper;

  static Database ? _database;

  Future<Database ? > get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User("
            "id INTEGER PRIMARY KEY, "
            "name TEXT, "
            "email TEXT, "
            "password TEXT "
            ")"
    );
    await db.execute(
        "CREATE TABLE patient("
            "id INTEGER PRIMARY KEY,"
            "name  TEXT , "
            "email TEXT, "
            "number TEXT, "
            "bloodType TEXT, "
            "age TEXT, "
            "address TEXT, "
            "doctorId TEXT "
            ")"
    );
    await db.execute(
        "CREATE TABLE patientRecord("
            "recordId INTEGER PRIMARY KEY,"
            "patientId Integer,"
            "heartBeat  TEXT,"
            "oxygenLevel TEXT,"
            "respireRate TEXT,"
            "bloodPressure TEXT"
            ")"
    );
  }
}