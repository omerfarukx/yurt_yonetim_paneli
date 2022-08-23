import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:flutter_application_6/status_servise.dart';

class ArizaTakipPage extends StatefulWidget {
  const ArizaTakipPage({Key key}) : super(key: key);

  @override
  State<ArizaTakipPage> createState() => _ArizaTakipPageState();
}

class _ArizaTakipPageState extends State<ArizaTakipPage> {
  StatusServiceAriza _statusServiceAriza = StatusServiceAriza();
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
          child: StreamBuilder<QuerySnapshot>(
            stream: _statusServiceAriza.getStatus(),
            builder: (context, snaphot) {
              return !snaphot.hasData
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: snaphot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost =
                            snaphot.data.docs[index] ?? '';

                        Future<void> _showChoiseDialog(BuildContext context) {}

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              _showChoiseDialog(context);
                            },
                            child: Container(
                              
                              decoration: BoxDecoration(
                                  color: Color(0xFFeeeee0),
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
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
                                        label: Text('Kat'),
                                      ),
                                      DataColumn(
                                        label: Text('Sorun'),
                                      ),
                                      DataColumn(
                                        label: Text('Email'),
                                      ),
                                    ], rows: [
                                      DataRow(cells: [
                                       
                                        DataCell(Text(
                                          "${mypost['Kat']}",
                                          style: TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        )),
                                        DataCell
                                        (Container(decoration: BoxDecoration(),
                                        width: size.width*0.3,

                                          child: Text(
                                            "${mypost['Sorun']}",
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                        DataCell(Text('3',)),
                                       
                                      ]),
                                      
                                    ])
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
            },
          ),
        ));
  }
}
