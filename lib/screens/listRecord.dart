
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/RecordModel.dart';
import '../database/record_database_helper.dart';
import 'HomeDrawer.dart';
import 'addRecord.dart';
import 'editRecord.dart';

class ListRecord extends StatefulWidget {
  const ListRecord({super.key,required this.title});

  final String title;
  @override
  State<ListRecord> createState() => _ListRecordState();
}
class _ListRecordState extends State<ListRecord> {
  int recordId=0;
  int patientId=0;
  String patientName='';
  @override
  void initState(){
    super.initState();
    init();
  }
    init() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      patientId = preferences.getInt('id')!;
      patientName = preferences.getString('patientName')!;
    });
  }
  int selectedId=0;
  void editRecord() {
    Navigator.push(context,
        MaterialPageRoute(builder:(_) => const EditRecord(title: 'Edit Record',)));
  }
  reload(){
    Navigator.push(context,
        MaterialPageRoute(builder:(_) => const ListRecord(title: 'List Records',)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: [
            const Text('List Records: '),
            Text(patientName),
          ],
        ),
      ),
      endDrawer: const MainDrawer(),
      body: Center(
        child: FutureBuilder<List<RecordModel>>(
            future: RecordDatabaseHelper.getRecords(patientId),
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

                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.all(10),
                          child: Column(children: [

                            Column(
                              children: [
                                _tile('RecordID', user.recordId.toString(),Icons.numbers),
                               // _tile('PatientID', user.patientId.toString(),Icons.numbers),
                                _tile('PatientName', patientName,Icons.person),
                                _tile('Heart Beat', user.heartBeat as String,Icons.heart_broken),
                                _tile('Oxygen Level', user.oxygenLevel as String, Icons.hearing),
                                _tile('Respire Rate', user.respireRate as String,Icons.air),
                                _tile('Blood Pressure', user.bloodPressure, Icons.bloodtype),
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
                                            preferences.setInt('recordId',user.recordId!);
                                            preferences.setString('patientName',user.patientName!);
                                            editRecord();

                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(30, 10, 10, 12),
                                        child: FilledButton(
                                          child: const Icon(
                                              Icons.delete
                                          ),
                                          onPressed: ()async {
                                              selectedId=user.recordId!;
                                              await RecordDatabaseHelper.deleteRecord(selectedId);
                                              reload();
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder:(_) => const AddRecord(title: 'AddRecord',)));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
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

