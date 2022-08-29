import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:flutter_application_6/yemekhane/yemekhanegiris.dart';

class AylikYemekListesi extends StatefulWidget {
  const AylikYemekListesi({Key key}) : super(key: key);

  @override
  State<AylikYemekListesi> createState() => _AylikYemekListesiState();
}

class _AylikYemekListesiState extends State<AylikYemekListesi> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.black26,
                  Colors.blueGrey,
                ],
              ),
            ),
          ),
          title: Text("Şehit Furkan Doğan Yurdu"),
          automaticallyImplyLeading: false,
          leading: new IconButton(
            onPressed: () => Navigator.pushReplacement(
              //Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YemekhaneGirisPage()),
            ),
            icon: new Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Güncelle"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Yemek Listesi Ekle"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                print("My account menu is selected.");
              } else if (value == 1) {
                print("Settings menu is selected.");
              } else if (value == 2) {
                print("Logout menu is selected.");
              }
            }),
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(top: size.width * 0.02),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/i4.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width * 1,
          height: size.height * 1,
          child: Column(children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                width: size.width * 1,
                height: size.height * 1,
              ),
            ),
          ]),
        ));
  }
}
