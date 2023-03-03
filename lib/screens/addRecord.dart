import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';
import 'package:mobileweb_hospitalapp/screens/login.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';

import '../comm/comHelper.dart';


class AddRecord extends StatefulWidget {
  const AddRecord({super.key,required this.title});

  final String title;
  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord>{


  int? selectedId;
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerComPassword = TextEditingController();

  AddRecord(){
    WidgetsFlutterBinding.ensureInitialized();
    if(textControllerName.text.isEmpty){
      alertDialog(context,"Please Enter User Name");
    }else if(textControllerEmail.text.isEmpty){
      alertDialog(context, "Please Enter Email");
    }else if(textControllerPassword.text.isEmpty){
      alertDialog(context, "Please Enter Password");
    }else if(textControllerComPassword.text.isEmpty){
      alertDialog(context, "Please Enter Confirm Password");
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('AddRecord'),
      ),
      body: SingleChildScrollView(
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
                  validator: (val) => val?.isEmpty== true ? 'Please Enter Your Name':textControllerName.text,
                  onSaved: (val)=> textControllerName.text=val!,
                  controller: textControllerName,
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

                  controller: textControllerEmail,
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
                  controller: textControllerPassword,
                  obscureText: true,
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

                  obscureText: true,
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
                    //AddRecord();
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const ListRecord(title: 'ListRecord',)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
