
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/Model/PatientModel.dart';
import 'package:mobileweb_hospitalapp/screens/addNewPatient.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/patient_database_helper.dart';
import 'editPatient.dart';

class ListPatients extends StatefulWidget {
  const ListPatients({super.key,required this.title});

  final String title;
  @override
  State<ListPatients> createState() => _ListPatientsState();
}



class _ListPatientsState extends State<ListPatients> {

  listPatient() {
    Navigator.push(context,
        MaterialPageRoute(builder:(_) => const ListRecord(title: 'ListRecord',)));
  }

  reload(){
    Navigator.push(context,
        MaterialPageRoute(builder:(_) => const ListPatients(title: 'List Patients',)));
  }
  int selectedId=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('List Patients'),
      ),
      body: Center(
        child: FutureBuilder<List<PatientModel>>(
            future: PatientDatabaseHelper.getPatients(),
            builder: (BuildContext context,
                AsyncSnapshot<List<PatientModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('No Patients in List.'))
                  :ListView(
                children: snapshot.data!.map((user) {
                  return Center(
                    child: Card(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: Column(children: [
                        Column(
                              children: [
                                _tile('Name', user.name as String,Icons.person),

                                _tile('Address', user.address as String, Icons.home),
                                _tile('Age', user.age as String,Icons.person),
                                _tile('MobileNum',user.number as String, Icons.mobile_screen_share),
                                _tile('Email', user.email as String,Icons.email),
                                _tile('Blood Type', user.bloodType as String, Icons.bloodtype),
                                _tile('DoctorID', user.doctorId as String, Icons.bloodtype),
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
                                            int? selectId=user.id;
                                            SharedPreferences preferences= await SharedPreferences.getInstance();
                                            preferences.setInt('id',selectId!);
                                            preferences.setString('patientName', user.name.toString());
                                            preferences.setString('patientAddress', user.address.toString());
                                            preferences.setString('patientMobileNum', user.number.toString());
                                            preferences.setString('patientEmail', user.email.toString());
                                            preferences.setString('patientBloodType', user.bloodType.toString());
                                            preferences.setString('patientDoctorID', user.doctorId.toString());
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
                                            selectedId=user.id!;
                                            await PatientDatabaseHelper.deletePatient(selectedId);
                                            reload();
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(12, 10, 10, 10),
                                        child: FilledButton(
                                          child: Text(
                                            'List ${user.name} Records',
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () async {
                                            //listPatient();
                                            int? selectId=user.id;
                                            SharedPreferences preferences= await SharedPreferences.getInstance();
                                            preferences.setInt('id',selectId!);
                                            preferences.setString('patientName', user.name.toString());
                                            listPatient();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                        )
                      ]),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder:(_) => const AddNewPatient(title: 'Add New Patient',)));
    },
    backgroundColor: Colors.blue,
    child: const Icon(Icons.add),

    ));
  }

  void editPatient() {
    Navigator.push(context,
        MaterialPageRoute(builder:(_) => const EditPatient(title: 'Edit Patient',)));
  }

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

