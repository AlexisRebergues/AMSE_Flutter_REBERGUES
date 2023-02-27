import 'package:flutter/material.dart';
import 'dart:math' as math;

class Tile {
  int type;
  Alignment alignment;
  String imageURL;
  int nbPiececote;
  Tile(this.type, this.imageURL, this.alignment, this.nbPiececote);
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
    Image image = Image.asset(tile.imageURL!);

    if (tile.nbPiececote == 3) {
      return (FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Container(
            child: Align(
              alignment: tile.alignment!,
              widthFactor: 0.3,
              heightFactor: 0.3,
              child: image,
            ),
          ),
        ),
      ));
    } else {
      return FittedBox(
        fit: BoxFit.fill,
        child: ClipRect(
          child: Container(
            child: Align(
              alignment: tile.alignment!,
              widthFactor: 1 / tile.nbPiececote,
              heightFactor: 1 / tile.nbPiececote,
              child: image,
            ),
          ),
        ),
      );
    }
  }
}

Widget tileNonEmptyVoisin(Tile tile) {
  Image image = Image.asset(tile.imageURL!);
  FittedBox fittedBox;
  if (tile.nbPiececote == 3) {
    fittedBox = FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: tile.alignment!,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: image,
          ),
        ),
      ),
    );
  } else {
    fittedBox = FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: tile.alignment!,
            widthFactor: 1 / tile.nbPiececote,
            heightFactor: 1 / tile.nbPiececote,
            child: image,
          ),
        ),
      ),
    );
  }

  return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      padding: EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[100],
          ),
          child: fittedBox));
}

void main() => runApp(new MaterialApp(home: FinalJeuTaquin()));

class FinalJeuTaquin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinalJeuTaquinState();
}

class FinalJeuTaquinState extends State<FinalJeuTaquin> {
  int nbEchangeauto = 7;
  int nbPieceCote = 3;
  int numeroEmpty = 1;
  bool dejamelange = false;
  List<Tile> tiles = [];
  @override
  Widget build(BuildContext context) {
    MiseajourListeTiles();
    if (!dejamelange) {
      Melangeauto();
      dejamelange = true;
    }
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
                  Melangeauto();
                });
              })
        ]));
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

  void MiseajourListeTiles() {
    if (tiles.isEmpty) {
      for (int i = 0; i < nbPieceCote; i++) {
        for (int j = 0; j < nbPieceCote; j++) {
          tiles.add(Tile(
              0,
              'image4.jpg',
              Alignment(-1 + 2 * j / (nbPieceCote - 1),
                  -1 + 2 * i / (nbPieceCote - 1)),
              nbPieceCote));
        }
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

  void EchangerTileEmpty(int i) {
    if (tiles[i].type == 1) {
      Tile oldEmpty = tiles[numeroEmpty];
      tiles[numeroEmpty] = tiles[i];
      tiles[i] = oldEmpty;
      numeroEmpty = i;
    }
  }

  void Melangeauto() {
    // tiles = [];
    int nbEchange = nbEchangeauto;
    while (nbEchange != 0) {
      int nextTile = math.Random().nextInt(nbPieceCote * nbPieceCote);
      if (Echangeable(nextTile)) {
        EchangerTileEmpty(nextTile);
        numeroEmpty = nextTile;
        nbEchange--;
      }
    }
    MiseajourListeTiles();
  }
}
