import 'package:flutter/material.dart';
import 'package:purduehcr_web/Pages/HomePage.dart';
import 'package:purduehcr_web/Pages/JoinHousePage.dart';
import 'package:purduehcr_web/Pages/LogInPage.dart';
import 'package:purduehcr_web/Pages/SignUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => HomePage(),
          '/login':(context) => LogInPage(),
          '/signup': (context) => SignUpPage(),
          '/join': (context) => JoinHousePage(),
        },
    );
  }
}