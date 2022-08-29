import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/yemekhane/ayl%C4%B1kyemeklistesi.dart';

import '../homepage.dart';

class YemekhaneGirisPage extends StatefulWidget {
  const YemekhaneGirisPage({Key key}) : super(key: key);

  @override
  State<YemekhaneGirisPage> createState() => _YemekhaneGirisPageState();
}

class _YemekhaneGirisPageState extends State<YemekhaneGirisPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
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
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
            icon: new Icon(Icons.arrow_back, color: Colors.white),
          ),
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
            Container(
              margin: EdgeInsets.only(
                top: 25,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15),
                  color: Colors.white,),
                   width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AylikYemekListesi()),),
                  child: Text(
                    "Aylık Yemek Listesi",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              
            )
          ]),
        ));
  }
}
