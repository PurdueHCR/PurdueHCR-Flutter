import 'package:flutter/material.dart';
import 'package:purduehcr_web/HomePage.dart';
import 'package:purduehcr_web/Utility_Views/TokenTestPage.dart';
import 'package:purduehcr_web/Utilities/FirebaseUtility.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FirebaseUtility.initializeFirebase(context);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/token': (context) => TokenTestPage(),
        },
    );
  }
}