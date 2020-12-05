import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rynhouseware/model/dbhelper.dart';
import 'package:rynhouseware/model/produk.dart';
import 'package:image_form_field/image_form_field.dart';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> with TickerProviderStateMixin {
  int _counter = 0;
  int _tabIndex = 0;

  TabController tabController;

  Produk _produk = Produk();
  List<Produk> _produks = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlPrice = TextEditingController();
  final _ctrlOldprice = TextEditingController();

  File _image;
  Uint8List _bytesimage;
  String imagedata;
  String ex;

  String DecoImage;

  _getImage(String image) async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });

      imagedata = base64Encode(_image.readAsBytesSync());
      this._produk.image = imagedata;

      return _produk.image;
    } else {
      return null;
    }

    // List<int> imagebytes = image.readAsBytesSync();
    // base64image = base64Encode(imagebytes);

    // _bytesimage = Base64Decoder().convert(base64image);

    // setState(() {
    //   _image = image;
    // });
    // onSaved:
    // setState(() => _produk.image = _bytesimage as String);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
      _referenceProdukList();
    });
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text(
            'Halaman Admin',
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "List Produk",
              ),
              Tab(
                text: "Tambah Produk",
              )
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30.0,
                ),
                RaisedButton(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () => _referenceProdukList(),
                  child: Text('Refresh'),
                ),
                _list()
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [_form()],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: 200,
                child: _image == null
                    ? Column(children: [
                        Stack(
                          children: <Widget>[
                            Image.network(
                              'https://static.thenounproject.com/png/187803-200.png',
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    _getImage(_produk.image);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Text('Tambah Gambar',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        )
                      ])
                    : Image.file(_image),
              ),
              TextFormField(
                controller: _ctrlName,
                decoration: InputDecoration(labelText: 'Nama Produk'),
                onSaved: (val) => setState(() => _produk.name = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required!' : null),
              ),
              TextFormField(
                controller: _ctrlPrice,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(labelText: 'Harga'),
                onSaved: (val) => setState(() => _produk.price = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required!' : null),
              ),
              TextFormField(
                controller: _ctrlOldprice,
                decoration: InputDecoration(labelText: 'Harga Lama'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onSaved: (val) => setState(() => _produk.oldprice = val),
                validator: (val) =>
                    (val.length == 0 ? 'This field is required!' : null),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () => _onSubmit(),
                  child: Text('Simpan'),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      );

  _referenceProdukList() async {
    List<Produk> x = await _dbHelper.fetchProduks();
    setState(() {
      _produks = x;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    form.save();
    if (_produk.id == null) {
      await _dbHelper.insertProduk(_produk);
    } else {
      await _dbHelper.updateProduk(_produk);
    }
    setState(() {
      _image = null;
    });
    _resetForm();
    _referenceProdukList();
    tabController.animateTo((tabController.index + 1) % 2);
  }

  _resetForm() {
    setState(() {
      _formKey.currentState.reset();
      _ctrlName.clear();
      _ctrlOldprice.clear();
      _ctrlPrice.clear();
      _produk.id = null;
    });
  }

  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              DecoImage = _produks[index].image;
              _bytesimage = Base64Decoder().convert(DecoImage);
              var harga1 = _produks[index].price;
              var harga2 = _produks[index].oldprice;
              harga1 = _produks[index].price;
              return Column(
                children: [
                  ListTile(
                    leading: Container(
                      child: _bytesimage == null
                          ? new Text('No Image Value')
                          : Image.memory(
                              _bytesimage,
                              fit: BoxFit.cover,
                            ),
                    ),
                    title: Text(
                      _produks[index].name.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Rp. $harga1 / Rp. $harga2'),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete_sweep,
                          color: Colors.blue,
                        ),
                        onPressed: () async {
                          await _dbHelper.deleteProduk(_produks[index].id);
                          _referenceProdukList();
                        }),
                    onTap: () {
                      setState(() {
                        _produk = _produks[index];
                        _ctrlName.text = _produks[index].name;
                        _ctrlPrice.text = _produks[index].price;
                        _ctrlOldprice.text = _produks[index].oldprice;
                        tabController.animateTo(tabController.index + 1);
                      });
                    },
                  ),
                  Divider(
                    height: 5.0,
                  )
                ],
              );
            },
            itemCount: _produks.length,
          ),
        ),
      );
}
