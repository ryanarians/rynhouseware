import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rynhouseware/pages/Favorit.dart';
import 'package:rynhouseware/pages/Home.dart';
import 'package:rynhouseware/pages/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Index',
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _children = [
    Home(),
    Favorit(),
    Login(),
  ];
  int currentindex = 0;

  void onTappedBar(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff6dd5ed),
        fixedColor: Colors.black,
        onTap: onTappedBar,
        currentIndex: currentindex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Saya',
          ),
        ],
      ),
    );
  }
}
