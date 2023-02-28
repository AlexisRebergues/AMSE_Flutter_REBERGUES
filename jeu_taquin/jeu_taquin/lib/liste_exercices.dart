import 'dart:js';

import 'package:flutter/material.dart';
import 'package:jeu_taquin/jeu_taquin_final.dart';
import 'package:jeu_taquin/moving_tiles.dart';
import 'package:jeu_taquin/moving_tiles_gridview.dart';
import 'package:jeu_taquin/taquin_board.dart';
import 'package:jeu_taquin/taquin_board_modifications.dart';
import 'transformer_image.dart';
import 'package:jeu_taquin/afficher_image.dart';
import 'as_cropped_image.dart';
import 'gridview_example.dart';

class Exercice {
  //"isbn10";"isbn13";"titre";"auteur";"editeur";"date";"langue";"description"
  Exercice(String titre, String sousTitre, WidgetBuilder buildFunction) {
    if (titre == "") {
      this.titre = "Inconnu";
    } else {
      this.titre = titre;
    }
    if (sousTitre == "") {
      this.sousTitre = "Inconnu";
    } else {
      this.sousTitre = sousTitre;
    }
    this.buildFunc = buildFunction;
  }
  late String titre;
  late String sousTitre;
  late WidgetBuilder buildFunc;
}

// buildFonction: (context => exo2.DisplaytitreWidget);
Exercice exercice1 =
    Exercice("Exercice 1", "Display an image", (context) => afficher_Image());
Exercice exercice2 = Exercice(
    "Exercice 2", "Rotate/Resize Image", (context) => transformerimage());

Exercice exercice3 = Exercice("Exercice 4", "Display a tile as a cropped image",
    ((context) => as_croped_image()));
// Exercice exercice4 = Exercice('image4.jpg', "Exercice 4");
Exercice exercice5a = Exercice(
    "Exercice 5a", "GridView Examples", ((context) => gridViewExamples()));

Exercice exercice5b =
    Exercice("Exercice 5b", "TaquinBoard", ((context) => TaquinBoard()));

Exercice exercice5c = Exercice("Exercice 5c", "TaquinBoardModifications",
    ((context) => TaquinBoardModifications()));

Exercice exercice6a =
    Exercice("Exercice 6a", "Moving Tiles", ((context) => PositionedTiles()));

Exercice exercice6b = Exercice("Exercice 6b", "Moving Tiles Gridview",
    ((context) => PositionedTilesGridview()));

Exercice exercice7 = Exercice(
    "Exercice 7", "Jeu Taquin final", ((context) => PageChoixNiveau()));

List<Exercice> ListeExercices = [
  exercice1,
  exercice2,
  exercice3,
  exercice5a,
  exercice5b,
  exercice5c,
  exercice6a,
  exercice6b,
  exercice7,
];
