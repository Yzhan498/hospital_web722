import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/listPatients.dart';
import 'package:mobileweb_hospitalapp/screens/login.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';
class AddNewPatient extends StatelessWidget {

  AddNewPatient({Key? key, required this.title});
  final String title;
  int? selectedId;
  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Patient'),
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

                  obscureText: true,
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

                  obscureText: true,
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

                  obscureText: true,
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

                  obscureText: true,
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

                  obscureText: true,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder:(_) => const ListPatients(title: 'List Patients',)));
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
