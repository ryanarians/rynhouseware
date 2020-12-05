// class Produk {
//   static const tblProduk = 'produks';
//   static const colId = 'id';
//   static const colName = 'name';
//   static const colPrice = 'price';
//   static const colOldprice = 'oldprice';

//   Produk({this.id, this.name, this.oldprice, this.price});

//   Produk.fromMap(Map<String, dynamic> map) {
//     id = map[colId];
//     name = map[colName];
//     price = map[colPrice];
//     oldprice = map[colOldprice];
//   }

//   int id;
//   String name;
//   String oldprice;
//   String price;

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       colName: name,
//       colPrice: price,
//       colOldprice: oldprice
//     };
//     if (id != null) {
//       map[colId] = id;
//       return map;
//     }
//   }
// }

class Produk {
  static const tblProduk = 'produks';
  static const colId = 'id';
  static const colName = 'name';
  static const colPrice = 'price';
  static const colOldprice = 'oldprice';
  static const colImage = 'image';

  Produk({this.id, this.name, this.price, this.oldprice, this.image});

  int id;
  String name;
  String price;
  String oldprice;
  String image;

  Produk.fromMap(Map<String, dynamic> map) {
    id = map[colId];
    name = map[colName];
    price = map[colPrice];
    oldprice = map[colOldprice];
    image = map[colImage];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      colName: name,
      colPrice: price,
      colOldprice: oldprice,
      colImage: image
    };
    if (id != null) {
      map[colId] = id;
    }
    return map;
  }
}
