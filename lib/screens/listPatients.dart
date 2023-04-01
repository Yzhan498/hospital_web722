
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/Model/PatientModel.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';

import '../database/patient_database_helper.dart';

class ListPatients extends StatefulWidget {
  const ListPatients({super.key,required this.title});

  final String title;
  @override
  State<ListPatients> createState() => _ListPatientsState();
}
class _ListPatientsState extends State<ListPatients> {

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
                                _tile('Name', 'John',Icons.person),
                                _tile('Address', '429 Castro St', Icons.home),
                                _tile('Age', '35',Icons.person),
                                _tile('MobileNum', '4294546666', Icons.mobile_screen_share),
                                _tile('Email', 'dd@hotmail.com',Icons.email),
                                _tile('Blood Type', 'O', Icons.bloodtype),
                                Container(
                                  margin: const EdgeInsets.all(30.0),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: FilledButton(
                                    child: const Text(
                                      'List Record',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:(_) => const ListRecord(title: 'ListRecord',)));
                                    },
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

    );
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

