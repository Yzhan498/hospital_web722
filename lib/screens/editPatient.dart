import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/database/patient_database_helper.dart';
import 'package:mobileweb_hospitalapp/screens/listPatients.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/PatientModel.dart';
import '../comm/comHelper.dart';
import 'dart:core';

void editPatient() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const EditPatient(title: "Edit Patient"));
}
class EditPatient extends StatefulWidget {
  const EditPatient({super.key,required this.title});
  final String title;
  @override
  State<EditPatient> createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  int patientId=0;
  String patientName='';
  String patientAddress='';
  String patientMobileNum='';
  String patientEmail='';
  String patientBlood='';
  String patientDoctorID='';
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

  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerNumber = TextEditingController();
  final textControllerBloodType = TextEditingController();
  final textControllerAge = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerDoctorId = TextEditingController();

  editPatient() async {
      PatientModel uModel = PatientModel(id:patientId,name: textControllerName.text,
          email: textControllerEmail.text,
          number: textControllerNumber.text,
          bloodType: textControllerBloodType.text,
          age: textControllerAge.text,
          address: textControllerAddress.text,
          doctorId: textControllerDoctorId.text);
      PatientDatabaseHelper.updatePatient(uModel);
      alertDialog(context, 'Successfully Saved');
      Navigator.push(context,
          MaterialPageRoute(
              builder: (_) => const ListPatients(title: 'List Patients',)));
  }

  @override
  Widget build(BuildContext context) {
    textControllerName.text=patientName.toString();
    textControllerAddress.text=patientAddress.toString();
    textControllerBloodType.text=patientBlood.toString();
    textControllerEmail.text=patientEmail.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Patient'),
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

                    controller: textControllerName,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Patient Name',

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(

                    controller: textControllerEmail,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'email'
                    ),
                  ),
                ),
                Container(

                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your Phone Number':null,
                    onSaved: (val)=> textControllerNumber.text=val!,
                    controller: textControllerNumber,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.mobile_screen_share),
                        hintText: 'Mobile Number'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(

                    controller: textControllerBloodType,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.bloodtype),
                        hintText: 'Blood Type'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your Age':null,
                    onSaved: (val)=> textControllerAge.text=val!,
                    controller: textControllerAge,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.numbers),
                        hintText: 'Age'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(

                    controller: textControllerAddress,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.home),
                        hintText: 'Address'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your DoctorID':null,
                    onSaved: (val)=> textControllerDoctorId.text=val!,
                    controller: textControllerDoctorId,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'DoctorID'
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
                      editPatient();
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

