import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/homepage.dart';
import 'package:flutter_application_6/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
   bool loggedIn = FirebaseAuth.instance.currentUser !=null;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  loggedIn ?HomePage():SignInScreen(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
      debugShowCheckedModeBanner:false
      
    );
  }
}
