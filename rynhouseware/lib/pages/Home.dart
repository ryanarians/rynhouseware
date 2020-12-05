import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rynhouseware/component/drawer.dart';

import 'package:rynhouseware/component/horizontal_listview.dart';
import 'package:rynhouseware/component/horzontal_listview2.dart';
import 'package:rynhouseware/component/products.dart';
import 'package:rynhouseware/model/produk.dart';
import 'package:rynhouseware/pages/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentHome = 0;

  static final List<String> imgSlider = ['slider1.jpg', 'slider2.jpg'];
  final CarouselSlider autoPlayImage = CarouselSlider(
    items: imgSlider.map((fileImage) {
      return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            'lib/images/slider/${fileImage}',
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
    autoPlay: true,
    enlargeCenterPage: true,
    aspectRatio: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text(
            'RynHouseware',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search_rounded),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff2193b0), Color(0xff6dd5ed)],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
        ),
        body: ListView(
          children: [
            //carousell
            autoPlayImage,

            new Container(
              width: 1000.0,
              padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
              child: new Text(
                'Category',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            HorizontalList(),
            HorizontalList2(),

            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                'Recent Products',
                style: TextStyle(fontSize: 18),
              ),
            ),

            Container(
              height: 320.0,
              child: Products(),
            )
          ],
        ),
      ),
    );
  }
}
