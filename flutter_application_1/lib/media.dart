import 'package:flutter/material.dart';

class Media {
  //"isbn10";"isbn13";"titre";"auteur";"editeur";"date";"langue";"description"
  Media(String nomMedia, String auteur, String date, String langue,
      String description, String image, bool liked) {
    if (nomMedia == "") {
      this.nomMedia = "Inconnu";
    } else {
      this.nomMedia = nomMedia;
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
    if (image == "") {
      this.image = "Inconnu";
    } else {
      this.image = image;
    }
  }

  late String nomMedia;
  late String auteur;
  late String isbn13;
  late String date;
  late String langue;
  late String description;

  late String image;
}

Media interstellar = Media("Interstellar", "Christopher Nolan", "2014",
    "English", "un film sur l'espace", 'INTERSTELLAR.jpg', false);

List<Media> listeMedia = [interstellar];
