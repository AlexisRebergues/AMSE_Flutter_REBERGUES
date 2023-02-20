import 'package:flutter/material.dart';
import 'afficher_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'liste_exercices.dart';

class Afficher_Exercice extends StatelessWidget {
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
            itemCount: ListeExercices.length,
            itemBuilder: (context, index) {
              var exo = ListeExercices[index];
              return Card(
                  child: ListTile(
                      title: Text(exo.titre),
                      subtitle: Text(exo.sousTitre),
                      trailing: Icon(Icons.play_arrow_rounded),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: exo.buildFunc),
                        );
                      }));
            }));
  }
}
