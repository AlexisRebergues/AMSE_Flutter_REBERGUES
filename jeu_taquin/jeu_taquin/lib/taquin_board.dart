import 'dart:js';

import 'package:flutter/material.dart';
import 'transformer_image.dart';
import 'package:jeu_taquin/afficher_image.dart';
import 'as_cropped_image.dart';

class Tile {
  Image? imageURL;
  Alignment? alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment!,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: this.imageURL!,
          ),
        ),
      ),
    );
  }
}

Tile tile1 =
    new Tile(imageURL: Image.asset('image4.jpg'), alignment: Alignment.topLeft);

Tile tile2 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(0.9, 0));

Tile tile3 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(1.8, 0));

Tile tile4 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(0, 0.9));

Tile tile5 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(0.9, 0.9));

Tile tile6 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(1.8, 0.90));

Tile tile7 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(0, 1.8));

Tile tile8 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(0.9, 1.8));

Tile tile9 = new Tile(
    imageURL: Image.asset('image4.jpg'),
    alignment: Alignment.topLeft + Alignment(1.8, 1.8));

// Tile tile3 =
//     new Tile(imageURL: Image.asset('image4.jpg'), alignment: Alignment(0.9, 0));

class TaquinBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tablet),
            label: 'Jeu',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: Colors.purple,
          ),
        ]),
        appBar: AppBar(
          title: Text('TP2'),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: InkWell(
                child: tile1.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: InkWell(
                child: tile2.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: InkWell(
                child: tile3.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: InkWell(
                child: tile4.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: InkWell(
                child: tile5.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: InkWell(
                child: tile6.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: InkWell(
                child: tile7.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: InkWell(
                child: tile8.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: InkWell(
                child: tile9.croppedImageTile(),
                onTap: () {
                  print("tapped on tile");
                },
              ),
            ),
          ],
        ));
  }
}
