import 'package:cloud_firestore/cloud_firestore.dart';

class Kullanicilar{
  String id;
  String tcController;
  String adController;
  String sehirController;
  String universiteController;
  String emailController;
  String bolumController;
  String sinifController;
  String odaController;

  Kullanicilar({this.id, this.tcController,this.adController,this.sehirController,this.universiteController,this.emailController,this.bolumController,this.sinifController,this.odaController});

  factory Kullanicilar.dokumandanGelen(DocumentSnapshot doc){
    return Kullanicilar(
      tcController:doc["tc"],
      adController: doc["adi"],
      sehirController: doc["sehir"],
      universiteController: doc["universite"],
      emailController: doc["email"],
      bolumController: doc["bolum"],
      sinifController: doc["sinif"],
      odaController: doc["oda"],
    );
  }
  factory Kullanicilar.firebasedenGelen(kullanici){
    return Kullanicilar(
      id: kullanici.uid,
      tcController: kullanici.tc,
      adController: kullanici.adi,
      sehirController: kullanici.sehir,
      universiteController: kullanici.universite,
      emailController: kullanici.email,
      bolumController: kullanici.bolum,
      sinifController: kullanici.sinif,
      odaController: kullanici.oda,

    );
  }
}