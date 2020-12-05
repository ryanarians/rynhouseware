import 'package:flutter/material.dart';
import 'package:rynhouseware/model/dbhelper.dart';
import 'package:rynhouseware/model/produk.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Produk _produk = Produk();
  List<Produk> _produks = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;

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
    final title = 'Long List';

    return ListView.builder(
      itemCount: _produks.length,
      itemBuilder: (context, index) {
        var nama = _produks[index].name;
        return ListTile(
          leading: Container(
            child: nama != null ? Text(nama) : Text("ga ada adata"),
          ),
          title: Text(nama),
        );
      },
    );
  }
}
