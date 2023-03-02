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
    Image image = Image.asset(
      tile.imageURL!,
      height: 500,
      width: 500,
    );

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

String imagechoisi = 'image4.jpg'; //CHOIX DE L'IMAGE EN GLOBAL
int nbEchangeauto = 0;

class PageChoixNiveau extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageChoixNiveauState();
}

class PageChoixNiveauState extends State<PageChoixNiveau> {
  List<String> CreerlisteImage() {
    List<String> listimage = [];
    for (int i = 1; i < 11; i++) {
      listimage.add((('image' + i.toString() + '.jpg')));
    }
    return listimage;
  }

  late List<String> listImage = CreerlisteImage();

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
        body: ListView.builder(
            itemCount: listImage.length,
            itemBuilder: (context, index) {
              var exo = listImage[index];
              return Card(
                  child: ListTile(
                      leading: Image.asset(listImage[index]),
                      title: Text("Niveau " + (index + 1).toString()),
                      subtitle: Text(
                          "Réalisable en " + (index + 1).toString() + " coups"),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        imagechoisi = listImage[index];
                        nbEchangeauto = index + 1;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => FinalJeuTaquin())),
                        );
                      }));
            }));
  }
}

void main() => runApp(new MaterialApp(home: FinalJeuTaquin()));

class FinalJeuTaquin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinalJeuTaquinState();
}

class FinalJeuTaquinState extends State<FinalJeuTaquin> {
  int nbPieceCote = 3;
  int numeroEmpty = 1;
  int NbCoup = 0;
  bool dejamelange = false;
  List<Tile> tiles = [];
  @override
  Widget build(BuildContext context) {
    MiseajourListeTiles();
    // if (!dejamelange) {
    //   Melangeauto();
    //   dejamelange = true;
    // }
    return Scaffold(
        appBar: AppBar(
          title: Text("Moving Tile Gridview"),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_circle),
            onPressed: () => setState(() {
                  if (!dejamelange) {
                    Melangeauto();
                    dejamelange = true;
                  }
                })),
        body: Column(children: [
          Container(
            height: 90,
            width: 100,
            child: Text("Coups: " + NbCoup.toString()),
          ),
          Center(
              child: Container(
                  height: 500,
                  width: 500,
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
                              if (Echangeable(index)) {
                                NbCoup += 1;
                              }

                              EchangerTileEmpty(index);
                              if (niveauFini()) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      FenetreDeGagne(context),
                                );
                              }
                            });
                          },
                        );
                      }))),
          Slider(
              value: nbPieceCote + 0.0,
              min: 3,
              max: 10,
              divisions: 7,
              label: nbPieceCote.round().toString(),
              onChanged: (double value) {
                setState(() {
                  nbPieceCote = value.toInt();
                  tiles = [];
                  MiseajourListeTiles();
                  dejamelange = false;
                });
              })
        ]));
  }

  //Widget creerBarredescore() {}

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
              imagechoisi,
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

  List<Tile> CreationdebaseListeTiles() {
    List<Tile> listdebase = [];
    if (listdebase.isEmpty) {
      for (int i = 0; i < nbPieceCote; i++) {
        for (int j = 0; j < nbPieceCote; j++) {
          listdebase.add(Tile(
              0,
              imagechoisi,
              Alignment(-1 + 2 * j / (nbPieceCote - 1),
                  -1 + 2 * i / (nbPieceCote - 1)),
              nbPieceCote));
        }
      }
    }
    for (int i = 0; i < nbPieceCote * nbPieceCote; i++) {
      if (i == numeroEmpty) {
        listdebase[i].type = 2;
      } else if (Echangeable(i)) {
        listdebase[i].type = 1;
      } else {
        listdebase[i].type = 0;
      }
    }
    return listdebase;
  }

  void EchangerTileEmpty(int i) {
    if (tiles[i].type == 1) {
      Tile oldEmpty = tiles[numeroEmpty];
      tiles[numeroEmpty] = tiles[i];
      tiles[i] = oldEmpty;
      numeroEmpty = i;
    }
  }

  Widget FenetreDeGagne(BuildContext context) {
    return new AlertDialog(
      title: const Text('Partie Gagnée'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Félicitations, vous avez réussi le niveau " +
              nbEchangeauto.toString() +
              " en " +
              NbCoup.toString() +
              " coups"),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => PageChoixNiveau())));
          },
          child: const Text('Retour au menu'),
        ),
      ],
    );
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

  bool niveauFini() {
    int numeroPiece = 0;
    for (int i = 0; i < nbPieceCote; i++) {
      for (int j = 0; j < nbPieceCote; j++) {
        if (tiles[numeroPiece].alignment !=
            Alignment(-1 + 2 * j / (nbPieceCote - 1),
                -1 + 2 * i / (nbPieceCote - 1))) {
          return false;
        }
        numeroPiece++;
      }
    }
    return true;
  }
}
