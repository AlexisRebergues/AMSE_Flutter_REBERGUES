import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeu_taquin/liste_exercices.dart';

class afficher_Image extends StatefulWidget {
  const afficher_Image({Key? key}) : super(key: key);

  @override
  State<afficher_Image> createState() => _Page_afficher_image();
}

class _Page_afficher_image extends State<afficher_Image> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.games,
              color: Colors.grey[800],
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Jeu du taquin',
            style: GoogleFonts.kanit(
                color: Colors.blue, fontSize: 40, fontWeight: FontWeight.w800),
          ),
        ),
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Column(children: [
            const Text(
              "Exercice 1",
            ),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                )),
              ),
            ),
            const Divider(
              thickness: 5,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(140, 0, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.view_carousel),
                    onTap: () => Navigator.pushNamed(context, "/actu"),
                  ),
                ],
              ),
            ),
            Expanded(child: AfficherImage()),
          ]),
        ));
  }
}

class AfficherImage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 1024,
        width: 720,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('image1.jpg'),
        )));
  }
}
