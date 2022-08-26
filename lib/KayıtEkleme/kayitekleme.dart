import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../duyuruislemleri/duyurugiris.dart';
import '../homepage.dart';

class KayitEklemePage extends StatefulWidget {
  const KayitEklemePage({Key key}) : super(key: key);

  @override
  State<KayitEklemePage> createState() => _KayitEklemePageState();
}

class _KayitEklemePageState extends State<KayitEklemePage> {
  final _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  Future<User> handleSignUp(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    return user;
  }

  TextEditingController tcController = TextEditingController();
  TextEditingController adController = TextEditingController();
  TextEditingController telController = TextEditingController();
  TextEditingController sehirController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController universiteController = TextEditingController();
  TextEditingController bolumController = TextEditingController();
  TextEditingController sinifController = TextEditingController();
  TextEditingController odaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference usersRef = _firestore.collection('users');
    bool isValidate = false;

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
            child: ListView(scrollDirection: Axis.vertical, children: [
              Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SingleChildScrollView(
                    child: Center(
                      child: TextFormField(
                        controller: tcController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "T.C Giriniz",
                          labelText: "T.C",
                          border: new OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            isValidate = false;
                            return "T.C Giriniz";
                          } else {
                            isValidate = true;
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: adController,
                      decoration: InputDecoration(
                        hintText: "İsim Soyisim",
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "İsim Soyisim Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "İsim Soyisim Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: telController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Telefon",
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Telefon Numarası Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Telefon Numarası Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: sehirController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Şehir",
                        labelText: "Şehir Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Şehir Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Email",
                        labelText: "Email Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Email Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: universiteController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Üniversite",
                        labelText: "Üniversite Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Üniversite Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: bolumController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Bölüm",
                        labelText: "Bölüm Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Bölüm Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: sinifController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Sınıf",
                        labelText: "SınıfGiriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Sınıf Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: odaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Oda Bİlgileri",
                        labelText: "Oda Bilgilerini Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Oda Girniz";
                        } else {
                          isValidate = true;
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Kaydet",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        
                        print("Kullanıcı Kaydı yapılıyor ");
                      }
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: "123456");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }

                      Map<String, String> movieData = {
                        'tc': tcController.text,
                        'ad': adController.text,
                        'tel': telController.text,
                        'şehir': sehirController.text,
                        'email': emailController.text,
                        'üniversite': universiteController.text,
                        'bolum': bolumController.text,
                        'sinif': sinifController.text,
                        'oda': odaController.text
                      };

                      if (isValidate) {
                        String tc = tcController.text;
                        String ad = adController.text;
                        String tel = telController.text;
                        String sehir = sehirController.text;
                        String email = emailController.text;
                        String uni = universiteController.text;
                        String bolum = bolumController.text;
                        String sinif = sinifController.text;
                        String oda = odaController.text;
                        await usersRef
                            .doc(FirebaseAuth.instance.currentUser.uid)
                            .set(
                          {
                            'T.C': '$tc',
                            'İsim Soyisim': '$ad',
                            'Telefon': '$tel',
                            'Şehir': '$sehir',
                            'Email': '$email',
                            'Üniversite': '$uni',
                            'Bölüm': '$bolum',
                            'Sınıf': '$sinif',
                            'Oda': '$oda',
                          },
                        );
                      }
                    },
                  )
                ]),
              ),
            ])));
  }
}
