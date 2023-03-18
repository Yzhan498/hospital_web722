
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/UserModel.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }
 initDatabase() async {
    Directory documentDirectory =await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path, 'information.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate:_onCreate,
    );
  }

 _onCreate(Database database, int version) async {
    await database.execute('''
    CREATE TABLE user(
    id INTEGER PRIMARY KEY,
    name  TEXT,
    email TEXT,
    password TEXT
    )
    ''');
  }



  Future<int?> add(UserModel user) async {
    Database? db = await instance.database;
    return await db?.insert('user', user.toMap());
  }

  Future<int?> update(UserModel grocery) async {
    Database? db = await instance.database;
    return await db?.update('user', grocery.toMap(),
        where: "id = ?", whereArgs: [grocery.id]);
  }


  Future<UserModel?> getLoginUser(String name,String password) async {
    var dbClient=await database;
    var res= await dbClient?.rawQuery("SELECT * FROM user WHERE "
    "name='name' AND "
    "password='password'");
    if(res!.isNotEmpty){
      return UserModel.fromMap(res.first);
    }
    return null;
  }

  Future<List<UserModel>> getGroceries() async {
    Database? db = await instance.database;
    var groceries = await db?.query('user', orderBy: 'name');
    List<UserModel> groceryList = groceries!.isNotEmpty
        ? groceries.map((c) => UserModel.fromMap(c)).toList()
        : [];
    return groceryList;
  }
}