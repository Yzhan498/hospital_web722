import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/RecordModel.dart';
import '../comm/comHelper.dart';
import '../database/record_database_helper.dart';
import 'HomeDrawer.dart';

void addNewPatient() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const AddRecord(title: "Add A New Record"));

}

class AddRecord extends StatefulWidget {
  static String routeName="/listPatient";
  const AddRecord({super.key,required this.title});
  final String title;
  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord>{

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
  final _formKey = GlobalKey<FormState>();

  final textControllerHeartBeat = TextEditingController();
  final textControllerOxygenLevel = TextEditingController();
  final textControllerRespireRate = TextEditingController();
  final textControllerBloodPressure = TextEditingController();

  addRecord() async {
      final form=_formKey.currentState;
      if ((form?.validate()==true)) {
        _formKey.currentState?.save();
        RecordModel  uModel= RecordModel(patientId:patientId,patientName:patientName,heartBeat: textControllerHeartBeat.text, oxygenLevel: textControllerOxygenLevel.text, respireRate: textControllerRespireRate.text,bloodPressure: textControllerBloodPressure.text);
        RecordDatabaseHelper.createRecord(uModel);
        alertDialog(context, 'Successfully Saved');
        Navigator.push(context,
            MaterialPageRoute(builder:(_) => const ListRecord(title: 'List Records',)));
      } else {
        alertDialog(context, 'Add failed');
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
      ),
      endDrawer: const MainDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('$patientName   Record',

                      style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                   ],
                ),
                const SizedBox(height: 20.0),
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
                      'Add Record',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      addRecord();
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
