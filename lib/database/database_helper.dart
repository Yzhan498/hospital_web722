
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance= DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory =await getApplicationDocumentsDirectory();
    String path= join(documentDirectory.path, 'users.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate:_onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT
    )
    ''');
  }


  Future<int> add(Users user) async {
    Database db = await instance.database;
    return await db.insert('users', user.toMap());
  }


  Future<int> update(Users user) async {
    Database db = await instance.database;
    return await db.update('users', user.toMap(),
        where: "id = ?", whereArgs: [user.id]);
  }

  Future<Users?> getLoginUser(String name,String password) async {
    var dbClint=await database;
    var res=await dbClint.rawQuery("SELECT * FROM users WHERE"
    "name='name' AND"
    "password='password'");
    if(res.isNotEmpty){
      return Users.fromMap(res.first);
    }
    return null;
  }
  
}
class Users {
  final int? id;
  final String name;
  final String email;
  final String password;


  Users({this.id,required this.name,required this.email,required this.password});

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );

  Map<String,dynamic> toMap() {
    return{
      'id':id,
      'name':name,
      'email':email,
      'password':password,
    };
  }
}