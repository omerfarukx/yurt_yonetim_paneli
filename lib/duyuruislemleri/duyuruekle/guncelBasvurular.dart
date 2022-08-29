import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/duyuruislemleri/duyurugiris.dart';

import '../../status_servise.dart';

class GunelBasvurularPage extends StatefulWidget {
  const GunelBasvurularPage({Key key}) : super(key: key);

  @override
  State<GunelBasvurularPage> createState() => _GunelBasvurularPageState();
}

class _GunelBasvurularPageState extends State<GunelBasvurularPage> {
  StatusServiceBasvuru _statusServiceBasvuru = StatusServiceBasvuru();

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
              MaterialPageRoute(builder: (context) => DuyuruIslemleriPage()),
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
            stream: _statusServiceBasvuru.getStatus(),
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
                                        label: Text("${mypost['Duyuru Adi']}"),
                                      ),
                                      
                                     
                                    ], rows: [
                                      DataRow(cells: [
                                        DataCell(Container(
                                          child: Text(
                                            "${mypost['ogrenci']}",
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.start,
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
          ),
        ));
  }
}
