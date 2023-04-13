
import 'package:flutter/cupertino.dart';
import 'package:mobileweb_hospitalapp/Model/RecordModel.dart';
import 'database_helper.dart';

class RecordDatabaseHelper {
  static String tableName = 'patientRecord';

  static Future<void> createRecord(RecordModel record) async {
    var database = await DatabaseHelper.instance.database;
    await database!.insert(tableName, record.toMap());
  }

  static Future<List<RecordModel>> getRecords(int patientId) async {
    var database = await DatabaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('SELECT * FROM $tableName WHERE patientId = ?', [patientId],);

    List<RecordModel> records = [];

    for (var element in list) {
      var record = RecordModel.fromMap(element);
      records.add(record);
    }
    await Future.delayed(const Duration(seconds: 2));
    return records;
  }

  static Future<List<RecordModel>> getCriticalRecords() async {
    var database = await DatabaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('SELECT * FROM $tableName');

    List<RecordModel> records = [];

    for (var element in list) {
      var record = RecordModel.fromMap(element);
      //  if(int.parse(record.bloodPressure)< 60)
      //  {
      //   print(record.respireRate);
      //   //records.add(record);
      // }
      records.add(record);
    }
    await Future.delayed(const Duration(seconds: 2));
    return records;
  }

  static Future<List<RecordModel>> getAllRecords() async {
    var database = await DatabaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('SELECT * FROM $tableName');

    List<RecordModel> records = [];

    for (var element in list) {
      var patient = RecordModel.fromMap(element);
      records.add(patient);
    }
    await Future.delayed(const Duration(seconds: 2));
    return records;
  }

  static Future<void> updateRecord(RecordModel record) async {
    var database = await DatabaseHelper.instance.database;
    await database!.update(tableName, record.toMap(), where: 'recordId = ?', whereArgs: [record.recordId],);
  }

  static Future<void> deleteRecord(int id) async {
    var database = await DatabaseHelper.instance.database;
    await database!.delete(tableName, where: 'id = ?', whereArgs: [id],);
  }
}