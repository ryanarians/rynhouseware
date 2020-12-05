import 'package:flutter/material.dart';

class HorizontalList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 30),
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'lib/images/kategori/poltek1.png',
            image_caption: 'Mixer',
          ),
          Category(
            image_location: 'lib/images/kategori/poltek1.png',
            image_caption: 'Mixer',
          ),
          Category(
            image_location: 'lib/images/kategori/poltek1.png',
            image_caption: 'Mixer',
          ),
          Category(
            image_location: 'lib/images/kategori/poltek1.png',
            image_caption: 'Mixer',
          ),
          Category(
            image_location: 'lib/images/kategori/poltek1.png',
            image_caption: 'Mixer',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                image_location,
                width: 100,
                height: 50,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  image_caption,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
