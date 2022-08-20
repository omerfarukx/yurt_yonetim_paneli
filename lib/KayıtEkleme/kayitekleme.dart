import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class KayitEklemePage extends StatefulWidget {
  const KayitEklemePage({Key key}) : super(key: key);

  @override
  State<KayitEklemePage> createState() => _KayitEklemePageState();
}

class _KayitEklemePageState extends State<KayitEklemePage> {
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
        child: Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            child: ListView(scrollDirection: Axis.vertical, children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'T.C',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'İsim Soyisim',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Telefon',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Şehir',
                      
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Üniversite',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Bölüm',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                  decoration: BoxDecoration(
                      color: Color(
                        0xFFeeeee0,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  width: size.width * 0.65,
                  height: size.height * 0.08,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Sınıf',
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
                    decoration: BoxDecoration(
                        color: Color(
                          0xFFeeeee0,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    width: size.width * 0.65,
                    height: size.height * 0.08,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Oda Bilgileri',
                      ),
                    ),
                    
                  )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 238, 6, 6),
              ),
              width: size.width * 0.001,
              height: size.height * 0.08,
              child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                          //Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()), //kayıt et butonu firebasede ilgili yerlere gönderecek ve aynı zamanda tabletten görüntülenebilcek.
                        ),
                    child: Text("Kayıt Et",
                        style: TextStyle(fontSize: 20, color: Colors.black)))),
                  )

                  
            ]),
          ),
        ),
      ),
    );
  }
}

