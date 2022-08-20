import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/homepage.dart';
import '../duyurugiris.dart';

class DuyuruEklePage extends StatefulWidget {
 
  const DuyuruEklePage({Key key}) : super(key: key);

  @override
  State<DuyuruEklePage> createState() => _DuyuruEklePageState();
}

class _DuyuruEklePageState extends State<DuyuruEklePage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController duyuruController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     CollectionReference moviesRef = _firestore.collection('movies');
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
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Duyuru Başlığı',
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
              height: size.height * 0.25,
              child: TextField(
                controller: duyuruController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Duyuru Metni',
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

                print(nameController.text);
                print(duyuruController.text);


                Map<String, dynamic> movieData = {
            'name': nameController.text,
            'duyuru': duyuruController.text
            
              
              };
              await moviesRef.doc(nameController.text).set({'kayıt': '$duyuruController'});
              },
              
                  child: Text(
                    "Yayınla",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
            ),
          ],
        )));
      
    
  }
}
