import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/addNewPatient.dart';
import 'HomeDrawer.dart';
import 'listAllRecords.dart';
import 'listPatients.dart';

class Home extends StatefulWidget {
  const Home({Key?key}): super(key:key);
  @override
   _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

 PageController pageController=PageController();
 List<Widget>pages=[const Home(),const ListPatients(title: 'List Patients',),const ListAllRecords(title: 'List All Records',)];
 int selectIndex=0;
 void onPageChanged(int index){
   setState(() {
     selectIndex=index;
   });
 }

void onItemTap(int selectedItems){
   pageController.jumpToPage(selectedItems);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Home'),
    ),
      endDrawer: const MainDrawer(),
      body:

      SingleChildScrollView(
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
                        MaterialPageRoute(builder:(_) => const AddNewPatient(title: 'Add New Patient',)));
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
                    'List All Records',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const ListAllRecords(title: 'List All Records',)));
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