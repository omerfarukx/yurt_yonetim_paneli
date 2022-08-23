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
  
}class StatusServiceYemek{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  Stream<QuerySnapshot>getStatus(){
    var ref = _firestore.collection("Yemek").snapshots();
    return ref;
  }
}