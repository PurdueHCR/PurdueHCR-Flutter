import 'package:flutter/material.dart';
import 'package:purduehcr_web/LogInCard.dart';


class LogInPage extends StatelessWidget {
  const LogInPage({Key key}) : super(key: key);

  void logIn(String email, String password){

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