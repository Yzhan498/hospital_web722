import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/patient_database_helper.dart';
import 'HomeDrawer.dart';
import 'editPatient.dart';
import 'listPatients.dart';

class ListPatientDetail extends StatelessWidget {
  final int id;
  final String patientName;
  final String patientAddress;
  final String patientEmail;
  final String age;
  final String number;
  final String bloodType;
  final String doctorId;

  const ListPatientDetail(this.id, this.patientName, this.patientAddress,this.age,this.number,
      this.patientEmail,this.bloodType,this.doctorId, {super.key});

  @override
  Widget build(BuildContext context) {
    void editPatient() {
      Navigator.push(context,
          MaterialPageRoute(builder:(_) => const EditPatient(title: 'Edit Patient',)));
    }
    listPatient() {
      Navigator.push(context,
          MaterialPageRoute(builder:(_) => const ListRecord(title: 'List Records',)));
    }
    reload(){
      Navigator.push(context,
          MaterialPageRoute(builder:(_) => const ListPatients(title:'List Patients')));
    }
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('List Patient Information'),
        ),
        endDrawer: const MainDrawer(),
      body: Center(

        child: Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Column(children: [
              Column(
                children: [
                  _tile('ID', id.toString(), Icons.person),
                  _tile('Name', patientName, Icons.person),
                  _tile('Address', patientAddress, Icons.home),
                  _tile('Age',age,Icons.numbers),
                  _tile('MobileNum',number, Icons.mobile_screen_share),
                  _tile('Email', patientEmail, Icons.email),
                  _tile('Blood Type', bloodType, Icons.bloodtype),
                  _tile('DoctorID', doctorId, Icons.bloodtype),
                  Center(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 10, 10, 12),
                          child: FilledButton(
                            child: const Icon(
                                Icons.edit
                            ),
                            onPressed: ()async {
                              SharedPreferences preferences= await SharedPreferences.getInstance();
                              preferences.setInt('id',id);
                              editPatient();
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 10, 10, 12),
                          child: FilledButton(
                            child: const Icon(
                                Icons.delete
                            ),
                            onPressed: ()async {

                              await PatientDatabaseHelper.deletePatient(id);
                              reload();
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 10, 10, 10),

                          child: FilledButton(
                            child: Text(
                              'List $patientName Records',
                              style: const TextStyle(color: Colors.white),
                            ),
                            onPressed: () async{
                              SharedPreferences preferences= await SharedPreferences.getInstance();
                              preferences.setInt('id',id);
                              preferences.setString('patientName', patientName);
                              listPatient();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
            )
        )
    ));

  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}


