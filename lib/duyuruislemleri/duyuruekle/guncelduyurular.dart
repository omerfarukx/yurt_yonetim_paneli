import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/duyuruislemleri/duyurugiris.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:flutter_application_6/status_servise.dart';

class GuncelDuyurularPage extends StatefulWidget {
  const GuncelDuyurularPage({Key key}) : super(key: key);

  @override
  State<GuncelDuyurularPage> createState() => _GuncelDuyurularPageState();
}

class _GuncelDuyurularPageState extends State<GuncelDuyurularPage> {
  @override
  Widget build(BuildContext context) {
    StatusService _statusService = StatusService();
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
        child:
             StreamBuilder<QuerySnapshot>(
          stream: _statusService.getStatus(),
          builder: (context, snaphot) {
            return !snaphot.hasData
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: snaphot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snaphot.data.docs[index]?? '';

                      Future<void> _showChoiseDialog(BuildContext context) {}

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            _showChoiseDialog(context);
                          },
                          child: Container(
                            height: size.height * .1,
                            decoration: BoxDecoration(
                                 color: Color(0xFFeeeee0),
                                border: Border.all(color: Colors.blue, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15
                                    ))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${mypost['Metin']}",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center,
                                  ),
                                  
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
