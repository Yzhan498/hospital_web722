import 'dart:convert';

import 'package:flutter/material.dart';
import '../Model/UserModel.dart';
import 'package:email_validator/email_validator.dart';
import '../comm/comHelper.dart';
import 'dart:core';
import '../database/user_database_helper.dart';
import 'Home.dart';
import 'package:http/http.dart' as http;

void signup() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const Signup(title: "WeCare"));
}
class Signup extends StatefulWidget {

  const Signup({super.key,required this.title});

  final String title;

@override
State<Signup> createState() => _SignupState();
}




class _SignupState extends State<Signup>{
  final _formKey= GlobalKey<FormState>();
  int? selectedId;
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerComPassword = TextEditingController();
  var dbHelper;

  @override
  void initState(){
    super.initState();
    dbHelper= UserDatabaseHelper;
  }
  signUp() async {


    final form=_formKey.currentState;
    if(form?.validate()==true){
        if(textControllerPassword.text!=textControllerComPassword.text){
          alertDialog(context, 'Please Type same password!');
        }else {
          _formKey.currentState?.save();
          UserModel  uModel= UserModel (name: textControllerName.text, email: textControllerEmail.text, password: textControllerPassword.text);
          UserDatabaseHelper.createUser(uModel);
          alertDialog(context, 'Successfully Saved');
          Navigator.push(context,
              MaterialPageRoute(builder:(_) => const Home()));
        }
    }
  }
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(

      appBar: AppBar(
        title: const Text('Sign Up'),
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
                Image.asset("assets/images/logo.png"),
                const SizedBox(height: 30.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty == true? 'Please Enter Your Name':null,
                    onSaved: (val)=> textControllerName.text=val!,
                    controller: textControllerName,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'User Name',

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
                    validator: (val) => val?.isEmpty == true? 'Please Enter Your Password':null,
                    onSaved: (val)=> textControllerPassword.text=val!,
                    controller: textControllerPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    validator: (val) => val?.isEmpty == true? 'Please Enter Your Confirm Password':null,
                    onSaved: (val)=> textControllerComPassword.text=val!,
                    controller: textControllerComPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Confirm Password'
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
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      signUp();
                    }
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
