import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/duyuruislemleri/duyuruekle/guncelduyurular.dart';
import 'package:flutter_application_6/homepage.dart';

import 'duyuruekle/duyuruekle.dart';

class DuyuruIslemleriPage extends StatefulWidget {
  const DuyuruIslemleriPage({Key key}) : super(key: key);

  @override
  State<DuyuruIslemleriPage> createState() => _DuyuruIslemleriPageState();
}

class _DuyuruIslemleriPageState extends State<DuyuruIslemleriPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF808080),
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
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFeeeee0,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.65,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      //Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DuyuruEklePage())),
                  child: Text("Duyuru Ekle", style: TextStyle(fontSize: 20))),
            ),
            Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(
                    0xFFeeeee0,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.65,
              height: size.height * 0.08,
              child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      //Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GuncelDuyurularPage())),
                  child: Text("Güncel Duyurular", style: TextStyle(fontSize: 20))),
            ),
          ],
        ),
      ),
    );
  }
}
