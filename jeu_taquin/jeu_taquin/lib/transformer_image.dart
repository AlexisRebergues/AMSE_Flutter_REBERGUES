import 'dart:async';

import 'package:flutter/material.dart';
import 'afficher_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'liste_exercices.dart';

class transformerimage extends StatefulWidget {
  const transformerimage({super.key});

  @override
  State<transformerimage> createState() => Transformationimage();
}

class Transformationimage extends State<transformerimage> {
  double rotateX = 20.0;
  double rotateZ = 10.0;
  bool miror = false;
  double scale = 0.0;
  double mirroirrotation = 0;
  bool animation = false;

  void duree() {
    const d = const Duration(milliseconds: 50);
    new Timer.periodic(d, animate);
  }
  // this new Timer automatically calls animate every 50ms

  void animate(Timer t) {
    if (rotateX == 100) {
      rotateX = 0;
    }
    if (rotateZ == 100) {
      rotateZ = 0;
    }
    if (scale == 100) {
      scale = 0;
    }
    rotateX = rotateX + 1;
    rotateZ = rotateZ + 1;
    scale = scale + 1;

    t.cancel(); // stops the timer
  }

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
        Transform(
            transform: Matrix4.skewY(0)
              ..rotateZ(rotateZ / 100)
              ..rotateY(mirroirrotation)
              ..rotateX(rotateX / 100)
              ..scale(scale / 100),
            child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('image2.jpg'),
                )))),
        Row(
          children: [
            const Text("RotateX :"),
            Slider(
                value: rotateX,
                max: 100,
                divisions: 100,
                label: rotateX.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    rotateX = value;
                    Transform.rotate(angle: rotateX);
                  });
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
                label: rotateZ.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    rotateZ = value;
                    Transform.rotate(angle: rotateZ);
                  });
                })
          ],
        ),
        Row(children: [
          const Text("Miror :"),
          Checkbox(
              checkColor: Colors.white,
              value: miror,
              onChanged: (bool? value) {
                setState(() {
                  miror = value!;
                  if (miror == true) {
                    mirroirrotation = 3.14;
                  } else {
                    mirroirrotation = 0;
                  }
                });
              })
        ]),
        Row(
          children: [
            const Text("Scale :"),
            Slider(
                value: scale,
                max: 100,
                divisions: 100,
                label: scale.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    scale = value;
                  });
                })
          ],
        ),
        IconButton(
            onPressed: () => duree(), icon: Icon(Icons.play_arrow_rounded))
      ]),
    );
  }
}
