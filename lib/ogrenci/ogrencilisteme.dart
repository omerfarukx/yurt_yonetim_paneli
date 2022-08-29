import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/ogrenci/ogrencidetay.dart';
import 'package:flutter_application_6/status_servise.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../homepage.dart';

class OgrenciListelemePage extends StatefulWidget {
  const OgrenciListelemePage({Key key}) : super(key: key);

  @override
  State<OgrenciListelemePage> createState() => _OgrenciListelemePageState();
}

class _OgrenciListelemePageState extends State<OgrenciListelemePage> {
  @override
  Widget build(BuildContext context) {
    StatusServiceUsers _statusServiceUsers = StatusServiceUsers();
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
          stream: _statusServiceUsers.getStatus(),
          builder: (context, snaphot) {
             return !snaphot.hasData
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: snaphot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot mypost =
                            snaphot.data.docs[index] ?? '';
                        String isimValue ="${mypost['İsim Soyisim']}";
                        String odaValue ="${mypost['Oda']}";
                        String telefonValue ="${mypost['Telefon']}";
                        String bolumValue ="${mypost['Bölüm']}";
                        String emailValue ="${mypost['Email']}";
                        String sinifValue ="${mypost['Sınıf']}";
                        String universiteValue ="${mypost['Üniversite']}";
                        String sehirValue ="${mypost['Şehir']}";
                        
                        
                      Future<void> _showChoiseDialog(BuildContext context) {}

                      return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFeeeee0),
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DataTable(columns: [
                DataColumn(
                  label: Text('İsim Soyisim'),
                ),
                DataColumn(
                  label: Text('Telefon'),
                ),
                DataColumn(label: Text('Oda')),
                DataColumn(label: Text('Detay'))
              ], rows: [
                DataRow(cells: [
                  DataCell(Container(
                    decoration: BoxDecoration(),
                    width: size.width * 0.30,
                    child: Text(
                      "${mypost['İsim Soyisim']}",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )),
                  DataCell(Text(
                    "${mypost['Telefon']}",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
                  DataCell(Text(
                    "${mypost['Oda']}",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  )),
                  DataCell(
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<int>(
                              value: 0,
                              child: TextButton(
                                child: (Text("Detay")),
                                onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OgrenciDetayPage(isimValue1: isimValue,BolumValue1: bolumValue,EmailValue1: emailValue,odaValue1: odaValue,SinifValue1: sinifValue,TelefonValue1: telefonValue,universiteValue1: universiteValue,sehirValue1: sehirValue,)),
                                ),
                              ))
                        ];
                      },
                    ),
                  )
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
      ),
    );
  }
}

Padding buidlpadding(DocumentSnapshot<Object> mypost, Size size,
    Future<void> _showChoiseDialog(BuildContext context)) {
  
}
