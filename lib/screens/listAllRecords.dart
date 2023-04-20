import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/criticalCondition.dart';
import '../Model/RecordModel.dart';
import '../database/record_database_helper.dart';
import 'HomeDrawer.dart';
import 'listRecordDetail.dart';

class ListAllRecords extends StatefulWidget {
  const ListAllRecords({super.key,required this.title});

  final String title;
  @override
  State<ListAllRecords> createState() => _ListAllRecordsState();
}
class _ListAllRecordsState extends State<ListAllRecords> {
  static int recordId =recordId;
  static String patientName=patientName;
  static String heartBeat=heartBeat;
  static String oxygenLevel=oxygenLevel;
  static String respireRate=respireRate;
  static String bloodPressure=bloodPressure;
  void selectedRecord(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return  ListRecordDetail(recordId,patientName,heartBeat,oxygenLevel,respireRate,
          bloodPressure);
    }));
  }
  int selectedId=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('List All Records'),
        ),
        endDrawer: const MainDrawer(),
        body: Center(
          child: FutureBuilder<List<RecordModel>>(
              future: RecordDatabaseHelper.getAllRecords(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RecordModel>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading...'));
                }
                return snapshot.data!.isEmpty
                    ? const Center(child: Text('No Records in List.'))
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
                            onTap: ()=>{
                              recordId=user.recordId!,
                              patientName=user.patientName!,
                              heartBeat=user.heartBeat!,
                              oxygenLevel=user.oxygenLevel!,
                              respireRate=user.respireRate!,
                              bloodPressure=user.bloodPressure,
                              selectedRecord(context),
                            },
                            child: Column(children: [
                              Column(
                                children: [
                                  // _tile('RecordID', user.recordId.toString(),Icons.numbers),
                                  // _tile('PatientID', user.patientId.toString(),Icons.person),
                                  _tile(user.patientName as String,user.bloodPressure,Icons.chevron_right),
                                  // _tile('Heart Beat', user.heartBeat as String,Icons.heart_broken),
                                  // _tile('Oxygen Level', user.oxygenLevel as String, Icons.hearing),
                                  // _tile('Respire Rate', user.respireRate as String,Icons.air),
                                  // _tile('Blood Pressure', user.bloodPressure, Icons.bloodtype),
                                ],
                              ),
                            ]),
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
                MaterialPageRoute(builder:(_) => const CriticalCondition(title: 'Critical Condition',)));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.emergency),
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
    trailing: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

