import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/database/patient_database_helper.dart';
import 'package:mobileweb_hospitalapp/screens/listPatients.dart';
import '../Model/PatientModel.dart';
import '../comm/comHelper.dart';
import 'dart:core';

void addNewPatient() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const AddNewPatient(title: "Add New Patient"));
}
class AddNewPatient extends StatefulWidget {
  const AddNewPatient({super.key,required this.title});
  final String title;
  @override
  State<AddNewPatient> createState() => _AddNewPatientState();
}

class _AddNewPatientState extends State<AddNewPatient> {

  final _formKey = GlobalKey<FormState>();
  int? selectedId;
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerNumber = TextEditingController();
  final textControllerBloodType = TextEditingController();
  final textControllerAge = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerDoctorId = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper= PatientDatabaseHelper;
  }
  addNewPatient() async {
    final form=_formKey.currentState;
    if ((form?.validate()==true)) {
      _formKey.currentState?.save();
      PatientModel  uModel= PatientModel(name: textControllerName.text, email: textControllerEmail.text, number: textControllerNumber.text,bloodType: textControllerBloodType.text,age: textControllerAge.text,address:textControllerAddress.text,doctorId: textControllerDoctorId.text);
      PatientDatabaseHelper.createPatient(uModel);
      alertDialog(context, 'Successfully Saved');
      Navigator.push(context,
          MaterialPageRoute(builder:(_) => const ListPatients(title: 'List Patients',)));
    } else {
      alertDialog(context, 'Login failed');
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Patient'),
      ),
      body: Form(
        key: _formKey,
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
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Patient Name':null,
                    onSaved: (val)=> textControllerName.text=val!,
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
                    validator: (val) {
                      if(val== null || val.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      if(!EmailValidator.validate(textControllerEmail.text)){
                        return 'Please Enter Your Valid Email';
                      }
                      return null;
                    },
                    onSaved: (val)=> textControllerEmail.text=val!,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your Blood Type':null,
                    onSaved: (val)=> textControllerBloodType.text=val!,
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
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your Address':null,
                    onSaved: (val)=> textControllerAddress.text=val!,
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
                      addNewPatient();
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

