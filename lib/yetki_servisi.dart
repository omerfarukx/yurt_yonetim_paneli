import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_6/kullanici.dart';

class YetkiServisi{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  Kullanicilar _kullaniciOlustur(User kullanici){
    return kullanici == null ? null : Kullanicilar.firebasedenGelen(kullanici);
  }

  Stream<Kullanicilar> get durumTakibi{
    return _firebaseAuth.authStateChanges().map(_kullaniciOlustur);
  }
  Future<Kullanicilar>mailIleKayit(String eposta, String sifre)async{
    var girisKarti = await _firebaseAuth.createUserWithEmailAndPassword(email: eposta, password: sifre);
    return _kullaniciOlustur(girisKarti.user);
  }
  //MAİL İLE GİRİŞ YAPMA
  Future<Kullanicilar>mailileGiris(String eposta, String sifre)async{
    var girisKarti = await _firebaseAuth.signInWithEmailAndPassword(email: eposta, password: sifre);
    return _kullaniciOlustur(girisKarti.user);
  }
  Future<void> cikiYap(){
    _firebaseAuth.signOut();
  }
}