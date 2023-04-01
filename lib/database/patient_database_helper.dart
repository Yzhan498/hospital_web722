
import '../Model/PatientModel.dart';
import 'database_helper.dart';

class PatientDatabaseHelper {
  static String tableName = 'patient';

  static Future<void> createPatient(PatientModel patient) async {
    var database = await DatabaseHelper.instance.database;
    await database!.insert(tableName, patient.toMap());
  }

  static Future<List<PatientModel>> getPatients() async {
    var database = await DatabaseHelper.instance.database;
    List<Map> list = await database!.rawQuery('SELECT * FROM $tableName');

    List<PatientModel> patients = [];

    for (var element in list) {
      var patient = PatientModel.fromMap(element);
      patients.add(patient);
    }
    await Future.delayed(const Duration(seconds: 2));
    return patients;
  }


  static Future<void> updatePatient(PatientModel patient) async {
    var database = await DatabaseHelper.instance.database;
    await database!.update(tableName, patient.toMap(), where: 'patientId = ?', whereArgs: [patient.patientId],);
  }

  static Future<void> deleteUser(int id) async {
    var database = await DatabaseHelper.instance.database;
    await database!.delete(tableName, where: 'patientId = ?', whereArgs: [id],);
  }
}