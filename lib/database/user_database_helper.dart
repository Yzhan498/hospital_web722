
import '../Model/UserModel.dart';
import 'database_helper.dart';

class UserDatabaseHelper {
  static String tableName = 'User';

  static Future<void> createUser(UserModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.insert(tableName, user.toMap());
  }

  static Future<List<UserModel>> getUsers() async {
    var database = await DatabaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('SELECT * FROM $tableName');

    List<UserModel> users = [];

    for (var element in list) {
      var user = UserModel.fromMap(element);
      users.add(user);
    }
    await Future.delayed(const Duration(seconds: 2));
    return users;
  }

  static Future<UserModel?> getLoginUser(String name,String password) async {
    var dbClient=await DatabaseHelper.instance.database;
    var res= await dbClient!.rawQuery("SELECT * FROM user WHERE "
        "name='$name' AND "
        "password='$password'");
    if(res.isNotEmpty){
      return UserModel.fromMap(res.first);
    }
    return null;
  }
  static Future<void> updateUser(UserModel user) async {
    var database = await DatabaseHelper.instance.database;
    await database!.update(tableName, user.toMap(), where: 'id = ?', whereArgs: [user.id],);
  }

  static Future<void> deleteUser(int id) async {
    var database = await DatabaseHelper.instance.database;
    await database!.delete(tableName, where: 'id = ?', whereArgs: [id],);
  }
}