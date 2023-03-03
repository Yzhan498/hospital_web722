import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/addNewPatient.dart';
import 'package:mobileweb_hospitalapp/screens/searchPatient.dart';
import 'HomeDrawer.dart';
import 'listPatients.dart';

class Home extends StatelessWidget {
  const Home({super.key,required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Home'),
    ),
      drawer: const MainDrawer(),
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
                margin: const EdgeInsets.all(30.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: FilledButton(
                  child: const Text(
                    'List All Patients',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const ListPatients(title: 'List Patients',)));
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
                    'Add New Patients',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => AddNewPatient(title: 'Add New Patient',)));

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
                    'Search Patient',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const SearchPatient(title: 'Search Patient',)));
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
