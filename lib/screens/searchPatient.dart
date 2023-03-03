import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';
import 'package:mobileweb_hospitalapp/screens/login.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';

import '../comm/comHelper.dart';


class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key,required this.title});

  final String title;
  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient>{


  int? selectedId;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
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
                margin: const EdgeInsets.all(30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: FilledButton(
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //SearchPatient();

                  },
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
                    'List Record',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //SearchPatient();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ListRecord(title: 'List Record')));
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
