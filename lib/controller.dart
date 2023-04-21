import 'package:http/http.dart' as http;
import 'Model/PatientModel.dart';

class Controller  {
  void onInit() {

    fetchPatientData();
  }

  Future<void> fetchPatientData() async {
    final response = await http.get(
        Uri.parse('http://localhost:3000/patients'));
    if (response.statusCode == 200) {
      PatientModel patientInformation = PatientModel();
       print(patientInformation);
    } else {

    }

  }
}
