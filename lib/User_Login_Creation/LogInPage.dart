import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/User_Login_Creation/LogInCard.dart';



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
        print("HERE 1");
        print("Found user so we are moving to home page: "+value.email);
        print("HERE 2");
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