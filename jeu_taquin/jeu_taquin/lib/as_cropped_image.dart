import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'afficher_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'liste_exercices.dart';

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

Tile tile =
    new Tile(imageURL: Image.asset('image3.jpg'), alignment: Alignment(0, 0));

class as_croped_image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
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
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200, child: Image.asset('image3.jpg', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
