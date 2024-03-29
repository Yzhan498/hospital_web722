
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';

import '../Model/PatientModel.dart';
import '../Model/RecordModel.dart';
import '../database/record_database_helper.dart';
import 'addRecord.dart';

class AllRecord extends StatefulWidget {
  const AllRecord({super.key,required this.title});

  final String title;
  @override
  State<AllRecord> createState() => _AllRecordState();
}
class _AllRecordState extends State<AllRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('All Records'),
      ),
      body: Center(
        child: FutureBuilder<List<RecordModel>>(
            future: RecordDatabaseHelper.getAllRecords(),
            builder: (BuildContext context,
                AsyncSnapshot<List<RecordModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('No Records for the patient.'))
                  :ListView(
                children: snapshot.data!.map((user) {
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 50.0),
                         Text(
                          'Patient Name: ${user.patientName}',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.all(10),
                          child: Column(children: [

                            Column(
                              children: [
                                _tile('Patient Name', user.patientName as String,Icons.person),
                                _tile('Heart Beat', user.heartBeat as String,Icons.heart_broken),
                                _tile('Oxygen Level', user.oxygenLevel as String, Icons.hearing),
                                _tile('Respire Rate', user.respireRate as String,Icons.air),
                                _tile('Blood Pressure', user.bloodPressure as String, Icons.bloodtype),
                              ],
                            ),
                          ]),
                        ),
                      ],
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

