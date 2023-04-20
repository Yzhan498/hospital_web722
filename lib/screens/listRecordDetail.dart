
import 'package:flutter/material.dart';

import '../Model/RecordModel.dart';
import '../database/record_database_helper.dart';

class ListRecordDetail extends StatelessWidget {
  final int recordId;
  final String patientName;
  final String heartBeat;
  final String oxygenLevel;
  final String respireRate;
  final String bloodPressure;

  const ListRecordDetail(this.recordId, this.patientName, this.heartBeat,
      this.oxygenLevel, this.respireRate,
      this.bloodPressure,{super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Record Detail'),
      ),
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
                    _tile('ID', recordId.toString(), Icons.person),
                    _tile('Name', patientName, Icons.person),
                    _tile('Heart Beat', heartBeat,Icons.heart_broken),
                    _tile('Oxygen Level', oxygenLevel, Icons.hearing),
                    _tile('Respire Rate', respireRate,Icons.air),
                    _tile('Blood Pressure', bloodPressure, Icons.bloodtype),
                  ],
                ),
              ]
              )
          )
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

