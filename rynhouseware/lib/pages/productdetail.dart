import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:rynhouseware/model/produk.dart';

class ProductDetail extends StatelessWidget {
  final product_name;
  final product_price;
  final product_oldprice;
  String decoimage;

  Uint8List _bytesimage;

  ProductDetail(
      {Key key,
      this.product_name,
      this.product_price,
      this.product_oldprice,
      this.decoimage})
      : super(key: key);

  Produk _produk = Produk();

  @override
  Widget build(BuildContext context) {
    _bytesimage = Base64Decoder().convert(decoimage);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Barang Unggulan",
                style: TextStyle(fontSize: 20, fontFamily: 'manjari'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                product_name,
                style: TextStyle(
                    fontFamily: 'manjari',
                    color: Colors.black87,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Harga",
                        style: TextStyle(fontSize: 15, fontFamily: 'manjari'),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\Rp$product_price",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'manjari'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      new RichText(
                        text: new TextSpan(
                          children: <TextSpan>[
                            new TextSpan(
                              text: '\Rp$product_oldprice',
                              style: new TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'manjari',
                                  color: Colors.black87),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: MemoryImage(_bytesimage), fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: const Offset(2, 8),
                            blurRadius: 10,
                          )
                        ]),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu tristique elit, non suscipit metus. Sed ullamcorper a elit eget viverra. Quisque laoreet urna id tempus ultricies.",
                  style: TextStyle(
                    fontFamily: 'manjari',
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Material(
                    color: Color(0xFFFF6464),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(9),
                        height: 40,
                        width: 41,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(width: 5),
                  Material(
                    color: Colors.cyan,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(9),
                        height: 40,
                        width: 41,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 41,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.black45,
                        onPressed: () {},
                        child: Text(
                          "Buy  Now".toUpperCase(),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff84fab0), Color(0xff8fd3f4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
