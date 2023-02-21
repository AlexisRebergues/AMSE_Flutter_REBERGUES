import 'dart:js';

import 'package:flutter/material.dart';
import 'transformer_image.dart';
import 'package:jeu_taquin/afficher_image.dart';
import 'as_cropped_image.dart';

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

List<Exercice> ListeExercices = [exercice1, exercice2, exercice3];
