import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StatusService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Duyurular").snapshots();
    return ref;
  }
}
class StatusServiceAriza{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Ariza").snapshots();
    return ref;
  }
  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Ariza").doc(docId).update({"Ariza Durumu":true});
    
    return ref;
  }

}class StatusServiceYemek{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Yemek").snapshots();
    return ref;
  }
}
class StatusServiceIzin{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Izinler").snapshots();
    return ref;
  }
}class StatusServiceBasvuru{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("AlinanBasvurular").snapshots();
    return ref;
  }
}

class StatusServiceUsers{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("users").snapshots();
    return ref;
  }
}
