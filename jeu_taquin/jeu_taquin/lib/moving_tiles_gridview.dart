import 'package:flutter/material.dart';
import 'dart:math' as math;

class Tile {
  String titre;
  int type;
  Tile(this.titre, this.type);
}

class TileWidget extends StatelessWidget {
  const TileWidget({Key? key, required this.tile}) : super(key: key);
  final Tile tile;
  @override
  Widget build(BuildContext context) {
    if (tile.type == 2) {
      return tileEmpty(tile);
    } else if (tile.type == 0) {
      return tileNonEmptyNonVoisin(tile);
    } else {
      return tileNonEmptyVoisin(tile);
    }
  }

  Widget tileEmpty(Tile tile) {
    return Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Center(child: Text("Empty ")));
  }

  Widget tileNonEmptyNonVoisin(Tile tile) {
    return Container(
        padding: const EdgeInsets.all(5),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.teal[100],
            ),
            child: Center(child: Text("tile " + tile.titre))));
  }

  Widget tileNonEmptyVoisin(Tile tile) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        padding: EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.teal[100],
            ),
            child: Text("tile " + tile.titre)));
  }
}

void main() => runApp(new MaterialApp(home: PositionedTilesGridview()));

class PositionedTilesGridview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesGridviewState();
}

class PositionedTilesGridviewState extends State<PositionedTilesGridview> {
  int nbPieceCote = 3;
  int numeroEmpty = 1;
  List<Tile> tiles = [];
  @override
  Widget build(BuildContext context) {
    MiseajourListeTiles();
    return Scaffold(
        appBar: AppBar(
          title: Text("Moving Tile Gridview"),
        ),
        body: Column(children: [
          Center(
              child: Container(
                  height: 550,
                  width: 720,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: nbPieceCote),
                      itemCount: tiles.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            child: TileWidget(tile: tiles[index]),
                          ),
                          onTap: () {
                            setState(() {
                              EchangerTileEmpty(index);
                            });
                          },
                        );
                      }))),
          Slider(
              value: nbPieceCote + 0.0,
              min: 3,
              max: 5,
              divisions: 2,
              label: nbPieceCote.round().toString(),
              onChanged: (double value) {
                setState(() {
                  nbPieceCote = value.toInt();
                  tiles = [];
                  MiseajourListeTiles();
                });
              })
        ]));
  }

  void MiseajourListeTiles() {
    if (tiles.isEmpty) {
      for (int i = 0; i < nbPieceCote * nbPieceCote; i++) {
        tiles.add(Tile(i.toString(), 0));
      }
    }
    for (int i = 0; i < nbPieceCote * nbPieceCote; i++) {
      if (i == numeroEmpty) {
        tiles[i].type = 2;
      } else if (Echangeable(i)) {
        tiles[i].type = 1;
      } else {
        tiles[i].type = 0;
      }
    }
  }

  bool Echangeable(int i) {
    if (i == numeroEmpty + 1 && i % nbPieceCote != 0) {
      return true;
    } else if (i == numeroEmpty - 1 && i % nbPieceCote != nbPieceCote - 1) {
      return true;
    } else if (i == numeroEmpty + nbPieceCote &&
        numeroEmpty <= (nbPieceCote - 1) * nbPieceCote - 1) {
      return true;
    } else if (i == numeroEmpty - nbPieceCote && numeroEmpty >= nbPieceCote) {
      return true;
    }
    return false;
  }

  void EchangerTileEmpty(int i) {
    if (tiles[i].type == 1) {
      Tile oldEmpty = tiles[numeroEmpty];
      tiles[numeroEmpty] = tiles[i];
      tiles[i] = oldEmpty;
      numeroEmpty = i;
    }
  }
}
