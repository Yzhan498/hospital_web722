import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/Model/PatientModel.dart';
import 'package:mobileweb_hospitalapp/screens/addNewPatient.dart';
import '../database/patient_database_helper.dart';
import 'HomeDrawer.dart';
import 'listPatientDetail.dart';

class ListPatients extends StatefulWidget {
  const ListPatients({super.key,required this.title});

  final String title;
  @override
  State<ListPatients> createState() => _ListPatientsState();
}

class _ListPatientsState extends State<ListPatients> {
  static int patientId =patientId;
  static String patientName=patientName;
  static String patientAddress=patientAddress;
  static String age=age;
  static String number=number;
  static String patientEmail=patientEmail;
  static String bloodType=bloodType;
  static String doctorID=doctorID;
  void selectedPatient(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return  ListPatientDetail(patientId,patientName,patientAddress,age,number,
          patientEmail,bloodType,doctorID);
    }));
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
        endDrawer: const MainDrawer(),
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
                    child:
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.all(5),
                      child: Column(children: [
                        InkWell(
                                onTap: () => {
                                  patientId=user.id!,
                                  patientName=user.name!,
                                  patientEmail=user.email!,
                                  patientAddress=user.address!,
                                  age=user.age!,
                                  number=user.number!,
                                  bloodType=user.bloodType!,
                                  doctorID=user.doctorId!,
                            selectedPatient(context)
                                },
                          child:
                                _tile(user.name as String,user.email as String,Icons.chevron_right),
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

}
ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    trailing: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

