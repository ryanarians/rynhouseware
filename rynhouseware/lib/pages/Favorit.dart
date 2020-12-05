import 'package:flutter/material.dart';

class Favorit extends StatefulWidget {
  Favorit({Key key}) : super(key: key);

  @override
  _FavoritState createState() => _FavoritState();
}

class _FavoritState extends State<Favorit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffffd194), Color(0xff70e1f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: Container(child: Text("Belum ada Halaman")),
          ),
        ),
      ),
    );
  }
}
