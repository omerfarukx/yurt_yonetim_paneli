import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../../homepage.dart';

class EtknlikYayinlaPage extends StatefulWidget {
  const EtknlikYayinlaPage({Key key}) : super(key: key);

  @override
  State<EtknlikYayinlaPage> createState() => _EtknlikYayinlaPageState();
}

class _EtknlikYayinlaPageState extends State<EtknlikYayinlaPage> {
    final _firestore = FirebaseFirestore.instance;

    TextEditingController basvuruAdi= TextEditingController();
    TextEditingController basvuruIcerik =TextEditingController();

  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((value) {
      setState(() {
        _dateTime = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
      CollectionReference basvuruRef = _firestore.collection('Basvurular');

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
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
            Column(children: [
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
                child: TextField(
                  controller: basvuruAdi,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Etkinlik Adı',
                  ),
                ),
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
                  child: Text(
                    _dateTime.day.toString() +
                        '-' +
                        _dateTime.month.toString() +
                        '-' +
                        _dateTime.year.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  onPressed: _showDatePicker,
                ),
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
                height: size.height * 0.25,
                child: TextField(
                  controller: basvuruIcerik,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Etkinlik İçeriği',
                  ),
                ),
              ),
              Container(
              padding: EdgeInsets.only(left: size.width * 0.02),
              margin: EdgeInsets.only(left: size.width * 0.08, top: 25),
              decoration: BoxDecoration(
                  color: Color(0xFFff0000
                
                  ),
                  borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.25,
              height: size.height * 0.08,
              child:  TextButton(onPressed:() async{


                Map<String, String> movieData = {
            'BasvuruAdi': basvuruAdi.text,
            'BasvuruIcerik': basvuruIcerik.text,
            

              };
              String Adi=basvuruAdi.text;
              String Icerik=basvuruIcerik.text;
              String tarih= _dateTime.day.toString() +
                        '-' +
                        _dateTime.month.toString() +
                        '-' +
                        _dateTime.year.toString();
              await basvuruRef.doc(basvuruAdi.text).set({'Başvuru Adi' : '$Adi','Basvuru Icerik':'$Icerik','Tarih':'$tarih'});
              },
              
              
                  child: Text(
                    "Yayınla",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
            ),
          ],
        )
              ]
        )
        )
        );
      
    
  }
}
