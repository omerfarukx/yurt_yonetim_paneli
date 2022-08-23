import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class StorageServisi{
  Reference _storage=FirebaseStorage.instance.ref();
  Future<String>profilResmiYukle({File resimDosyasi}) async{
    Reference resimYeri =
    _storage.child("gonderi_${randomAlphaNumeric(9)}.jpg");
    UploadTask yuklemeGorevi = resimYeri.putFile(resimDosyasi);
    TaskSnapshot snapshot =await yuklemeGorevi;
    String indirmeUrl =await snapshot.ref.getDownloadURL();
    print("İndirme URl si:"+indirmeUrl);
    return indirmeUrl;
  }
  
}