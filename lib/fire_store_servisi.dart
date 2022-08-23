
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'storage_servisi.dart';

class FireStoreSevisi{
  

  FirebaseFirestore _firestore =FirebaseFirestore.instance;
  final db =FirebaseFirestore.instance;
  ogrenciKayit(tcController,adController,telController,sehirController,emailController,universiteController,bolumController,sinifController,odaController) async{
    int kayitDurumu=0;
    var doc =await db .collection("users").doc(FirebaseAuth.instance.currentUser.uid).get();
    if (!doc.exists){
      String indirmeUrl = await StorageServisi().profilResmiYukle();
      db .collection("users").doc(FirebaseAuth.instance.currentUser.uid).set({
        "T.C":tcController.text,
        "İsim Soyisim":adController.text,
        "Telefon":telController.text,
        "Şehir":sehirController.text,
        "Email":emailController.text,
        "Üniversite":universiteController.text,
        "Bölüm":bolumController.text,
        "Sınıf":sinifController.text,
        "Oda":odaController.text,
        "resim":indirmeUrl,
      });
      kayitDurumu=1;
    }
    return kayitDurumu;
  }
}