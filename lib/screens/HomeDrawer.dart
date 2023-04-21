import 'package:flutter/material.dart';
import 'package:mobileweb_hospitalapp/screens/addNewPatient.dart';
import 'package:mobileweb_hospitalapp/screens/listPatients.dart';

import 'listAllRecords.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(String title, IconData icon, VoidCallback tabHandler) {
    return ListTile(
      onTap: tabHandler,
      leading: Icon(
        icon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(
            'WeCare',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        buildListTile('List Patients', Icons.list, () {
          Navigator.push(context,
              MaterialPageRoute(builder:(_) => const ListPatients(title: 'List Patients',)));
          //Navigator.of(context).pushReplacementNamed('/listPatients');
        }),
        buildListTile('Add New Patient', Icons.person, () {
          Navigator.push(context,
              MaterialPageRoute(builder:(_) => const AddNewPatient(title: 'Add New Patient',)));

        }),
        buildListTile('List All Records', Icons.list, () {
          Navigator.push(context,
              MaterialPageRoute(builder:(_) => const ListAllRecords(title: 'List All Records',)));
          //Navigator.of(context).pushReplacementNamed('/listPatients');
        }),
      ]),
    );
  }
}
