import 'dart:js';

import 'package:flutter/material.dart';
import 'transformer_image.dart';
import 'package:jeu_taquin/afficher_image.dart';
import 'as_cropped_image.dart';

class Tile {
  Image? imageURL;
  Alignment? alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile(int nbPiece) {
    if (nbPiece == 3) {
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
    } else {
      return FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Container(
            child: Align(
              alignment: alignment!,
              widthFactor: 1 / nbPiece,
              heightFactor: 1 / nbPiece,
              child: this.imageURL!,
            ),
          ),
        ),
      );
    }
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

class TaquinBoardModifications extends StatefulWidget {
  const TaquinBoardModifications({super.key});

  @override
  State<TaquinBoardModifications> createState() =>
      TaquinBoardModificationsState();
}

class TaquinBoardModificationsState extends State<TaquinBoardModifications> {
  List<Tile> creertoutetile(int nbPiece) {
    double machin = nbPiececote / 3;

    List<Tile> listTile = [];
    for (int i = 0; i < nbPiece; i++) {
      for (int j = 0; j < nbPiece; j++) {
        Tile tile = new Tile(
            imageURL: Image.asset('image4.jpg'),
            alignment: Alignment.topLeft +
                Alignment(0.9 / machin * j, 0.9 / machin * i));
        listTile.add(tile);
      }
    }
    return listTile;
  }

  List<Widget> creerlistewidgetcorrespondant(List<Tile> listtile, int nbPiece) {
    List<Widget> listeWidget = [];
    for (int i = 0; i < listtile.length; i++) {
      Widget widget = Container(
        padding: const EdgeInsets.all(4),
        color: Colors.teal[100],
        child: InkWell(
          child: listtile[i].croppedImageTile(nbPiece),
          onTap: () {
            print("c'est bon");
          },
        ),
      );
      listeWidget.add(widget);
    }
    return listeWidget;
  }

  int nbPiececote = 3;
  late List<Tile> creerensembletile = creertoutetile(nbPiececote);
  late List<Widget> creerlistwidget =
      creerlistewidgetcorrespondant(creerensembletile, nbPiececote);

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
        body: Column(children: [
          Container(
            height: 550,
            width: 720,
            child: GridView.count(
              childAspectRatio: 1,
              primary: false,
              padding: const EdgeInsets.all(4),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: nbPiececote,
              children: creerlistwidget,
            ),
          ),
          Slider(
              value: nbPiececote + 0.0,
              min: 3,
              max: 5,
              divisions: 2,
              label: nbPiececote.round().toString(),
              onChanged: (double value) {
                setState(() {
                  nbPiececote = value.toInt();
                  creerensembletile = creertoutetile(nbPiececote);
                  creerlistwidget = creerlistewidgetcorrespondant(
                      creerensembletile, nbPiececote);
                });
              })
        ]));
  }
}
