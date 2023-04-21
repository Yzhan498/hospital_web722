import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/RecordModel.dart';
import '../comm/comHelper.dart';
import 'dart:core';

import '../database/record_database_helper.dart';
import 'listRecord.dart';

void editRecord() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const EditRecord(title: "Edit Record"));
}
class EditRecord extends StatefulWidget {
  const EditRecord({super.key,required this.title});
  final String title;
  @override
  State<EditRecord> createState() => _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {
  int recordID=0;
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
      recordID = preferences.getInt('recordId')!;
      patientId = preferences.getInt('patientId')!;
      patientName = preferences.getString('patientName')!;
    });
  }

  final textControllerHeartBeat = TextEditingController();
  final textControllerOxygenLevel = TextEditingController();
  final textControllerRespireRate = TextEditingController();
  final textControllerBloodPressure = TextEditingController();

  editRecord() async {
    RecordModel uModel = RecordModel(recordId:recordID,patientId:patientId,patientName:patientName,heartBeat: textControllerHeartBeat.text,oxygenLevel: textControllerOxygenLevel.text,respireRate: textControllerRespireRate.text,bloodPressure: textControllerBloodPressure.text
     );
    RecordDatabaseHelper.updateRecord(uModel);
    alertDialog(context, 'Successfully Saved');
    Navigator.push(context,
        MaterialPageRoute(
            builder: (_) => const ListRecord(title: 'List Record',)));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Record'),
      ),
      body: Form(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Patient Heart Beat':null,
                    onSaved: (val)=> textControllerHeartBeat.text=val!,
                    controller: textControllerHeartBeat,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.heart_broken),
                      hintText: 'Heart Heat Beat',

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Patient Oxygen Level':null,
                    onSaved: (val)=> textControllerOxygenLevel.text=val!,
                    controller: textControllerOxygenLevel,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.hail),
                        hintText: 'Oxygen Level'
                    ),
                  ),
                ),
                Container(

                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Patient Respire Rate':null,
                    onSaved: (val)=> textControllerRespireRate.text=val!,
                    controller: textControllerRespireRate,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.air),
                        hintText: 'Respire Rate'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Patient Blood Pressure':null,
                    onSaved: (val)=> textControllerBloodPressure.text=val!,
                    controller: textControllerBloodPressure,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.bloodtype_rounded),
                        hintText: 'Blood Pressure'
                    ),
                  ),
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
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      editRecord();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

