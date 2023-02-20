import 'package:flutter/material.dart';

class Exercice {
  //"isbn10";"isbn13";"titre";"auteur";"editeur";"date";"langue";"description"
  Exercice(String image, String nomExercice) {
    if (image == "") {
      this.image = "Inconnu";
    } else {
      this.image = image;
    }
    if (nomExercice == "") {
      this.nomExercice = "Inconnu";
    } else {
      this.nomExercice = nomExercice;
    }
  }
  late String image;
  late String nomExercice;
}

Exercice exercice1 = Exercice('image1.jpg', "Exercice 1");
Exercice exercice2 = Exercice('image2.jpg', "Exercice 2");
Exercice exercice3 = Exercice('image3.jpg', "Exercice 3");
Exercice exercice4 = Exercice('image4.jpg', "Exercice 4");

List<Exercice> ListeExercices = [exercice1, exercice2, exercice3, exercice4];
