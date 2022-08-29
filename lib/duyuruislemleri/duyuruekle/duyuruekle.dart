import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
     CollectionReference duyuruRef = _firestore.collection('Duyurular');
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
                 color: Color.fromARGB(255, 47, 194, 62),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.50),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  )
                ]),
              width: size.width * 0.30,
            height: size.height * 0.08,
              child:  TextButton(onPressed:() async{

                print(nameController.text);
                print(duyuruController.text);


                Map<String, String> movieData = {
            'name': nameController.text,
            'duyuru': duyuruController.text,

              };
              String metin=duyuruController.text;
              await duyuruRef.doc(nameController.text).set({'Metin' : '$metin'});
              Fluttertoast.showToast(msg: "Duyuru Gönderildi",
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             timeInSecForIosWeb: 5,
             backgroundColor: Colors.amber,
             textColor: Colors.white,
             fontSize: 15);
             Navigator.pushReplacement(
              //Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DuyuruEklePage()));
              
              },
              
              
                  child: Text(
                    "Yayınla",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
            ),
          ],
        )));
      
    
  }
}
