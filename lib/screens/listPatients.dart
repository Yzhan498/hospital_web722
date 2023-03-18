
import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/Model/UserModel.dart';
import 'package:mobileweb_hospitalapp/database/database_helper.dart';
import 'package:mobileweb_hospitalapp/screens/listRecord.dart';

class ListPatients extends StatefulWidget {
  const ListPatients({super.key,required this.title});

  final String title;
  @override
  State<ListPatients> createState() => _ListPatientsState();
}
class _ListPatientsState extends State<ListPatients> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('List Patients'),
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(
            future: DatabaseHelper.instance.getGroceries(),
            builder: (BuildContext context,
                AsyncSnapshot<List<UserModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('No Groceries in List.'))
                  :ListView(
                children: snapshot.data!.map((user) {
                  return Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: Column(children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',                                height: 250,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'Patient Photo',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.black,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        Column(
                              children: [
                                _tile('Name', 'John',Icons.person),
                                _tile('Address', '429 Castro St', Icons.home),
                                _tile('Age', '35',Icons.person),
                                _tile('MobileNum', '4294546666', Icons.mobile_screen_share),
                                _tile('Email', 'dd@hotmail.com',Icons.email),
                                _tile('Blood Type', 'O', Icons.bloodtype),
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
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:(_) => const ListRecord(title: 'ListRecord',)));
                                    },
                                  ),
                                ),
                              ],
                        )
                      ]),
                    ),
                  );
                }).toList(),
              );
            }),
          // child: Card(
          //   child: ListView(
          //     children: [
          //       _tile('Name', 'John',Icons.person),
          //       _tile('Address', '429 Castro St', Icons.home),
          //       _tile('Age', '35',Icons.person),
          //       _tile('MobileNum', '4294546666', Icons.mobile_screen_share),
          //       _tile('Email', 'dd@hotmail.com',Icons.email),
          //       _tile('Blood Type', 'O', Icons.bloodtype),
          //       Container(
          //         margin: const EdgeInsets.all(30.0),
          //         width: double.infinity,
          //         decoration: BoxDecoration(
          //           color: Colors.blue,
          //           borderRadius: BorderRadius.circular(30.0),
          //         ),
          //         child: FilledButton(
          //           child: const Text(
          //             'List Record',
          //             style: TextStyle(color: Colors.white),
          //           ),
          //           onPressed: () {
          //             Navigator.push(context,
          //                 MaterialPageRoute(builder:(_) => const ListRecord(title: 'ListRecord',)));
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //

      ),

    );
  }

}
ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

