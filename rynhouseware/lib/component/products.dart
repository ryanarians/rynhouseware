import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rynhouseware/model/produk.dart';
import 'package:rynhouseware/pages/productdetail.dart';
import 'package:rynhouseware/model/dbhelper.dart';

class Products extends StatefulWidget {
  Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _counter = 0;
  Produk _produk = Produk();
  List<Produk> _produks = [];

  Uint8List _bytesimage;
  String DecoImage;

  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  var product_list = [
    {
      "name": "Blazer",
      "picture": "lib/images/products/produk1.jpg",
      "old_price": 5000,
      "price": 10000,
    },
  ];

  @override
  void initState() {
    setState(() {
      _dbHelper = DatabaseHelper.instance;
      _referenceProdukList();
    });

    super.initState();
  }

  _referenceProdukList() async {
    List<Produk> x = await _dbHelper.fetchProduks();
    setState(() {
      _produks = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _produks.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        DecoImage = _produks[index].image;
        _bytesimage = Base64Decoder().convert(DecoImage);
        var harga = _produks[index].price;
        var hargalama = _produks[index].oldprice;
        return Container(
            child: _bytesimage != null
                ? Card(
                    child: Hero(
                      tag: Text("Hero 1"),
                      child: Material(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return ProductDetail(
                                product_name: _produks[index].name,
                                product_price: _produks[index].price,
                                product_oldprice: _produks[index].oldprice,
                                decoimage: _produks[index].image,
                              );
                            }));
                          },
                          child: GridTile(
                            footer: Container(
                              color: Colors.white70,
                              child: ListTile(
                                leading: Transform(
                                  transform:
                                      Matrix4.translationValues(0.0, 10, 0.0),
                                  child: Text(
                                    _produks[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                title: Text(
                                  "\Rp$harga,-",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 11),
                                ),
                                subtitle: Text(
                                  "\Rp$hargalama,-",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 11),
                                ),
                              ),
                            ),
                            child: Image.memory(
                              _bytesimage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                // Card(
                //         child: Hero(
                //           tag: new Text('Hero1'),
                //           child: Material(
                //             child: InkWell(
                //               onTap: () => Navigator.of(context).push(
                //                   new MaterialPageRoute(
                //                       builder: (context) => new ProductDetail())),
                //               child: GridTile(
                //                 footer: Container(
                //                   color: Colors.white70,
                //                   child: ListTile(
                //                     leading: Transform(
                //                       transform:
                //                           Matrix4.translationValues(0.0, 10, 0.0),
                //                       child: Text(
                //                         _produks[index].name,
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.bold,
                //                             fontSize: 15),
                //                       ),
                //                     ),
                //                     title: Text(
                //                       "\Rp$_produks[index].price,-",
                //                       style: TextStyle(
                //                           color: Colors.red,
                //                           fontWeight: FontWeight.w800),
                //                     ),
                //                     subtitle: Text(
                //                       "\Rp$_produks[index].oldprice,-",
                //                       style: TextStyle(
                //                           color: Colors.black,
                //                           fontWeight: FontWeight.w800,
                //                           decoration: TextDecoration.lineThrough),
                //                     ),
                //                   ),
                //                 ),
                //                 child: Image.asset(
                //                   _produks[index].image,
                //                   fit: BoxFit.cover,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                : Text("Tidak Ada Data"));
      },
    );
  }
}
