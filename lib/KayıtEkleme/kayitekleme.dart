import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    bool isValidate = true;
   String dropdownValue = 'Adana';
   String dropdownValue1 = 'Hazırlık';
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
                        inputFormatters: [LengthLimitingTextInputFormatter(11)],
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
                          if (value.length < 11) {
                            isValidate = false;
                            return "T.C Giriniz";
                          } else {
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
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: telController,
                      keyboardType: TextInputType.phone,
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
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                     
                  DropdownButtonFormField(
                      value: dropdownValue,
                      elevation: 10,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      
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
                        String pattern = r'\w+@\w+\.\w+';
                        if (value.isEmpty) {
                          isValidate = false;
                          return 'Email Giriniz.';
                        } else if (!RegExp(pattern).hasMatch(value)) {
                          isValidate = false;
                          return 'Lütfen geçerli bir eposta adresi giriniz.';
                        } else {
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
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                      value: dropdownValue1,
                      elevation: 10,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue1 = newValue;
                        });
                      },
                      items: <String>['Hazırlık','1','2','3','4','5','6']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Sınıf",
                        labelText: "Sınıf Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Sınıf Girniz";
                        } else {
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
                        hintText: "Oda Bilgileri",
                        labelText: "Oda Bilgilerini Giriniz",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          isValidate = false;
                          return "Oda Girniz";
                        } else {
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
                      if (_formKey.currentState.validate()) {}

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
                        String sehir = dropdownValue;
                        String email = emailController.text;
                        String uni = universiteController.text;
                        String bolum = bolumController.text;
                        String sinif = dropdownValue1;
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
                        Fluttertoast.showToast(
                            msg: "Kayıt Başarıyla Eklendi",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 5,
                            backgroundColor: Colors.amber,
                            textColor: Colors.white,
                            fontSize: 15);
                        Navigator.pushReplacement(
                            //Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KayitEklemePage()));
                      }

                      isValidate = true;
                    },
                  )
                ]),
              ),
            ])));

            
  }
}
