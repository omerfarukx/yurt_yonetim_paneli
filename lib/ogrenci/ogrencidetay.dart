import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/ogrenci/ogrencilisteme.dart';

import '../homepage.dart';

class OgrenciDetayPage extends StatefulWidget {
  final String isimValue1;

  final String odaValue1;
  final String EmailValue1;
  final String SinifValue1;
  final String BolumValue1;
  final String TelefonValue1;
  final String universiteValue1;
  final String sehirValue1;
  const OgrenciDetayPage({
    Key key,
    this.isimValue1,
    this.odaValue1,
    this.EmailValue1,
    this.SinifValue1,
    this.BolumValue1,
    this.TelefonValue1,
    this.universiteValue1,
    this.sehirValue1,
  }) : super(key: key);

  @override
  State<OgrenciDetayPage> createState() => _OgrenciDetayPageState();
}

class _OgrenciDetayPageState extends State<OgrenciDetayPage> {
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
            MaterialPageRoute(builder: (context) => OgrenciListelemePage()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              child: Text(
                "T.c",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.isimValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.sehirValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
             padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.EmailValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.universiteValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.BolumValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.SinifValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Text(
                widget.odaValue1,textAlign:TextAlign.center,
                style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              height: size.height * 0.05,
              width: size.width * 0.6,
              child: TextButton(
                child: Text("İzinleri", style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                height: size.height * 0.05,
                width: size.width * 0.6,
                child: TextButton(
                  child: Text(
                    "Başvurular",
                    style: TextStyle(fontSize: 20),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
