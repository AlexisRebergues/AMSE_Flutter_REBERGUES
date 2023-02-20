import 'package:flutter/material.dart';
import 'afficher_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'liste_exercices.dart';

class transformerimage extends StatelessWidget {
  double rotateX = 0.0;
  double rotateZ = 0.0;
  bool miror = false;
  double scale = 0.0;

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
      body: Column(children: [
        Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            height: 300,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('image2.jpg'),
            ))),
        Row(
          children: [
            const Text("RotateX :"),
            Slider(
                value: rotateX,
                max: 100,
                divisions: 100,
                label: rotateX.round().toString(),
                onChanged: (double value) {
                  rotateX = value;
                })
          ],
        ),
        Row(
          children: [
            const Text("RotateZ :"),
            Slider(
                value: rotateZ,
                max: 100,
                divisions: 100,
                label: rotateX.round().toString(),
                onChanged: (double value) {
                  rotateZ = value;
                })
          ],
        ),
        Row(children: [
          const Text("Miror :"),
          Checkbox(
              checkColor: Colors.white,
              value: miror,
              onChanged: (bool? value) {
                miror = value!;
              })
        ]),
        Row(
          children: [
            const Text("Scale :"),
            Slider(
                value: rotateZ,
                max: 100,
                divisions: 100,
                label: scale.round().toString(),
                onChanged: (double value) {
                  scale = value;
                })
          ],
        ),
      ]),
    );
  }
}
