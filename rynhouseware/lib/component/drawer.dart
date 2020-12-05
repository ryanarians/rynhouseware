import 'package:flutter/material.dart';
import 'package:rynhouseware/main.dart';
import 'package:rynhouseware/pages/admin.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Halaman Pengunjung'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            title: Text('Halaman Admin'),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Admin()));
            },
          ),
        ],
      ),
    );
  }
}
