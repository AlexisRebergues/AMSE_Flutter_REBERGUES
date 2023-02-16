import 'package:flutter/material.dart';

class Media {
  //"isbn10";"isbn13";"titre";"auteur";"editeur";"date";"langue";"description"
  Media(String nomLivre, String auteur, String date, String langue,
      String description, String image, bool liked) {
    if (nomLivre == "") {
      this.nomLivre = "Inconnu";
    } else {
      this.nomLivre = nomLivre;
    }
    if (auteur == "") {
      this.auteur = "Inconnu";
    } else {
      this.auteur = auteur;
    }
    if (date == "") {
      this.date = "Inconnue";
    } else {
      this.date = date;
    }
    if (langue == "") {
      this.langue = "Inconnue";
    } else if (langue == "Fr") {
      this.langue = "Français";
    } else {
      this.langue = langue;
    }
    if (description == "") {
      this.description = "Inconnu";
    } else {
      this.description = description;
    }
  }

  late String nomLivre;
  late String auteur;
  late String isbn13;
  late String date;
  late String langue;
  late String description;

  late String image;
}

Media interstellar = Media("Interstellar", "Christopher Nolan", "2014",
    "English", "2euros", "image.jpg", false);

List listeMedia = [interstellar];
