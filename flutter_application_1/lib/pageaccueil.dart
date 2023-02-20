import 'package:flutter/material.dart';
import 'media.dart';
import 'package:google_fonts/google_fonts.dart';

class Page_Manu extends StatefulWidget {
  const Page_Manu({Key? key}) : super(key: key);

  @override
  State<Page_Manu> createState() => _Page_ManuState();
}

class _Page_ManuState extends State<Page_Manu> {
  String media = "Livre";
  String _data = "";

  List<List<dynamic>> _row = [];

  String afficheMedia(Media book) {
    String auteur = book.auteur;
    String titre = book.nomMedia;
    String date = book.date;
    String langue = book.langue;

    String res =
        " Auteur : $auteur\n Titre : $titre\n Date : $date\n Langue : $langue\n";
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[800],
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Gestion des Medias',
            style: GoogleFonts.kanit(
                color: Colors.orange,
                fontSize: 22,
                fontWeight: FontWeight.w800),
          ),
          actions: [
            // IconButton(
            //     icon: Icon(
            //       Icons.add_box_outlined,
            //       color: Colors.grey[800],
            //       size: 30,
            //     ),
            //     onPressed: () {
            //       //Navigator.push(context,
            //       //  MaterialPageRoute(builder: (context) => addLivre()));
            //     }),
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Column(children: [
            const Text(
              "Filtrer les médias",
            ),
            // DropdownButton<String>(
            //   value: media,
            //   icon: const Icon(Icons.arrow_downward),
            //   elevation: 16,
            //   style: const TextStyle(color: Colors.black),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.black,
            //   ),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       media = newValue!;
            //     });
            //   },
            //   items: <String>['Lavoisier']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Filtrer par médias",
                        style: TextStyle(fontSize: 10, color: Colors.yellow),
                      ),
                      Text(
                        "(pas encore fonctionnel)",
                        style: TextStyle(fontSize: 10, color: Colors.orange),
                      ),
                    ],
                  ),
                )),
              ),
              //onTap: () => _scan(),
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
                  const Text(
                    "Inventaire des médias",
                  ),
                  //SizedBox(width: 70,),
                  GestureDetector(
                    child: Icon(Icons.view_carousel),
                    onTap: () => Navigator.pushNamed(context, "/actu"),
                  ),
                ],
              ),
            ),
            Expanded(child: MediaSection()),
          ]),
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
            label: 'Medias',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
            backgroundColor: Colors.purple,
          ),
        ]));
  }
}

class MediaSection extends StatelessWidget {
  final _MediaStream = listeMedia;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: listeMedia.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10),
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 240,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(listeMedia[index].image),
                    ))),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 240,
                  width: 500,
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 5,
                              child: Text(
                                listeMedia[index].nomMedia,
                                style: GoogleFonts.nunito(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 60,
                              left: 5,
                              child: Text(
                                listeMedia[index].date,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100,
                              left: 5,
                              child: Text(
                                listeMedia[index].auteur,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 140,
                              left: 5,
                              child: Text(
                                "Description: " + listeMedia[index].description,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            //Positioned(
                            //top: 5,
                            // right: -15,
                            // child: AlerteButton(document: document),
                            //   ),
                          ],
                        ),
                      ),

                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         " Auteur : " + listeMedia[index].auteur,
                      //         style: GoogleFonts.nunito(
                      //           fontSize: 16,
                      //           fontWeight: FontWeight.w600,
                      //           color: Colors.orange[300],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text(
                      //           ' Langue : ' + listeMedia[index].langue,
                      //           style: GoogleFonts.nunito(
                      //             fontSize: 14,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   margin:
                      //       EdgeInsets.only(left: 100.0, top: 0, bottom: 0, right: 0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Text(
                      //             "Description :" + listeMedia[index].description,
                      //             style: GoogleFonts.nunito(
                      //               fontSize: 14,
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w400,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      //         const Icon(
                      //           Icons.place,
                      //           color: Colors.orange,
                      //           size: 14.0,
                      //         ),
                      //         Text(
                      //           listeMedia[index].nomMedia,
                      //           style: GoogleFonts.nunito(
                      //             fontSize: 14,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //         ),
                      //       ]),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// class AlerteButton extends StatelessWidget {
//   AlerteButton({required this.document});

//   DocumentSnapshot document;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         style: ButtonStyle(
//           foregroundColor: MaterialStateProperty.all(Colors.white),
//           backgroundColor: MaterialStateProperty.all(Colors.orange),
//           elevation: MaterialStateProperty.all(10),
//         ),
//         child: Row(
//           children: [
//             Icon(Icons.bookmark_add_outlined),
//             SizedBox(width: 5),
//             Text("Emprunter"),
//           ],
//         ),
//         onPressed: () {
//           Alert(
//             context: context,
//             type: AlertType.warning,
//             title: "Confirmer votre emprunt",
//             desc:
//                 "Êtes-vous sûr de vouloir emprunter ce livre ?\n Une fois cette action validée, le livre sera définitivement supprimé de la liste",
//             buttons: [
//               DialogButton(
//                 child: Text(
//                   "Annuler",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 onPressed: () => Navigator.pop(context),
//                 color: Color.fromRGBO(0, 179, 134, 1.0),
//               ),
//               DialogButton(
//                 child: Text(
//                   "Confirmer",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 onPressed: () => {
//                   _firestore.collection("Livre").doc(document.id).delete(),
//                   Navigator.pop(context),
//                   print('lezgo')
//                 },
//                 gradient: LinearGradient(colors: [
//                   Color.fromRGBO(116, 116, 191, 1.0),
//                   Color.fromRGBO(52, 138, 199, 1.0)
//                 ]),
//               )
//             ],
//           ).show();
//         },
//       ),
//     );
//   }
// }


// /*MaterialButton(
//                               color: Colors.white,
//                               shape: CircleBorder(),
//                               onPressed: () {
//                                 _firestore.collection("Livre").doc(document.id).delete();
//                               },
//                               child: const Icon(
//                                 Icons.takeout_dining_outlined,
//                                 color: Colors.orange,
//                                 size: 20,
//                               ),
//                             ),*/