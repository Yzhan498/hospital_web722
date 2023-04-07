
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';

import '../Model/PatientModel.dart';
import '../Model/RecordModel.dart';
import '../database/record_database_helper.dart';
import 'addRecord.dart';

class ListRecord extends StatefulWidget {
  const ListRecord({super.key,required this.title});

  final String title;
  @override
  State<ListRecord> createState() => _ListRecordState();
}
class _ListRecordState extends State<ListRecord> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('List Record'),
      ),
      body: Center(
        child: FutureBuilder<List<RecordModel>>(
            future: RecordDatabaseHelper.getRecords(),
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
                        const Text(
                          'Name:John',
                          style: TextStyle(
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
                                  _tile('Time', '10:30',Icons.date_range),
                                  _tile('Heart Heat Beat', '135/min',Icons.heart_broken),
                                  _tile('Oxygen Level', '120/80 ml', Icons.hearing),
                                  _tile('Respire Rate', '25/min',Icons.air),
                                  _tile('Blood Pressure', '10/8O', Icons.bloodtype),
                              ],
                            ),

                              Container(
                                margin: const EdgeInsets.all(30.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: FilledButton(
                                  child: const Text(
                                    'Add Record',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder:(_) => const AddRecord(title: 'AddRecord',)));
                                  },
                                ),
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
      floatingActionButton: _buildFab(),
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

_buildFab() {
  bool visibilityFlag = true;
  double max;
  double currentScroll;

  if (_scrollController.hasClients) {
    //visibilityFlag = true;

    max = _scrollController.position.maxScrollExtent;
    double min = _scrollController.position.minScrollExtent;
    currentScroll = _scrollController.position.pixels;

    if ((min == currentScroll) &&
        (_scrollController.position.userScrollDirection ==
            ScrollDirection.idle)) {
      visibilityFlag = true;
    } else if (max == currentScroll) {
      visibilityFlag = false;
    }
  }
