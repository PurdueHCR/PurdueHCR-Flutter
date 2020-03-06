import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/LogInCard.dart';
import 'package:purduehcr_web/Pages/HomePage.dart';
import 'package:purduehcr_web/Utilities/FirebaseUtility.dart';



class LogInPage extends StatefulWidget {


  LogInPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInPageState();
  }

}
class LogInPageState extends State<LogInPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((value){
      if(value != null){
        Navigator.of(context).pushReplacementNamed('/');
        print("Moving to Home Page");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 220, 220),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.22,
          height: MediaQuery.of(context).size.height * 0.4,
          child: LogInCard(),
        ),
      )
    );
  }
}