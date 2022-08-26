import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:editable/commons/math_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/status_servise.dart';

import 'homepage.dart';

class IzinIslemleriPage extends StatefulWidget {
  const IzinIslemleriPage({Key key}) : super(key: key);

  @override
  State<IzinIslemleriPage> createState() => _IzinIslemleriPageState();
}

class _IzinIslemleriPageState extends State<IzinIslemleriPage> {
 
    StatusServiceIzin _statusServiceIzin = StatusServiceIzin();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            child: StreamBuilder<QuerySnapshot>(
              stream: _statusServiceIzin.getStatus(),
              builder: (context, snaphot) {
                return !snaphot.hasData
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: snaphot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot mypost =
                              snaphot.data.docs[index] ?? '';

                          Future<void> _showChoiseDialog(
                              BuildContext context) {}

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                _showChoiseDialog(context);
                              },
                              
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFeeeee0),
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DataTable(columns: [
                                        
                                        DataColumn(
                                          label: Text('Gidiş'),
                                        ), DataColumn(
                                          label: Text('Dönüş'),
                                        ), DataColumn(
                                          label: Text('Şehir'),
                                        ),
                                        DataColumn(
                                          label: Text('Öğrenci'),
                                        ),
                                      ], rows: [
                                        DataRow(cells: [
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                           
                                            child: Text(
                                              "${mypost['Gidis']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                            
                                            child: Text(
                                              "${mypost['Donus']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                            width: size.width * 0.10,
                                            child: Text(
                                              "${mypost['Sehir']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                          DataCell(Container(
                                            decoration: BoxDecoration(),
                                            
                                            child: Text(
                                              "${mypost['Ogrenci']}",
                                              style: TextStyle(fontSize: 16),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                        ])
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
              },
            )));
  }
}
