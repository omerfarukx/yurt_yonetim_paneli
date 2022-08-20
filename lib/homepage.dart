import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/Kay%C4%B1tEkleme/kayitekleme.dart';
import 'package:flutter_application_6/duyuruislemleri/duyurugiris.dart';
import 'package:flutter_application_6/yemekhane/yemekhanegiris.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF808080),
        centerTitle: true,
        leading: Container(
            width: 200,
            height: 50,
            child: Image(
              image: AssetImage("assets/iycc.png"),
            )),
        leadingWidth: 200,
        title: Text("Şehit Furkan Doğan"),
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
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KayitEklemePage()),),
                  child: Text(
                    "Kayıt Ekleme",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DuyuruIslemleriPage())),
                  child: Text(
                    "Duyuru İşlemleri",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YemekhaneGirisPage())),
                  child: Text(
                    "Yemekhane İşlemleri",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),SizedBox(
                height: 10,
              ),
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(
                  child: Text(
                    "Kantin İşlemleri",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),SizedBox(
                height: 10,
              ),
               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                width: size.width * 0.65,
                height: size.height * 0.08,
                child: TextButton(
                  child: Text(
                    "Öğrenci Listeleme",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
