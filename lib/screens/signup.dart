import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/login.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';
import 'package:email_validator/email_validator.dart';
import '../comm/comHelper.dart';
import 'dart:core';


class Signup extends StatefulWidget {
  const Signup({super.key,required this.title});

  final String title;
@override
State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup>{
  int? selectedId;
  final _formKey=GlobalKey<FormState>();
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPassword = TextEditingController();
  final textControllerComPassword = TextEditingController();

  signUp(){

    if(textControllerName.text.isEmpty){
      alertDialog(context,"Please Enter User Name");
    }else if(textControllerEmail.text.isEmpty){
      alertDialog(context, "Please Enter Email");
      if(EmailValidator.validate(textControllerEmail.text)==false){
        alertDialog(context, "Please Enter Correct Email");
      }
    }else if(textControllerPassword.text.isEmpty){
      alertDialog(context, "Please Enter Password");
    }else if(textControllerComPassword.text.isEmpty){
      alertDialog(context, "Please Enter Confirm Password");
      if(textControllerComPassword.text!=textControllerPassword.text)
        {
          alertDialog(context, "Please Enter Same Password!");
        }
    }else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const Login(title: 'Login')),
              (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Form(
        key:_formKey,
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
                    validator: (val) => val?.isEmpty== true ? 'Please Enter Your Name':null,
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
                    onPressed: () {
                      signUp();

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
