import 'package:flutter/material.dart';
import 'package:purduehcr_web/CreateAccount.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CreateAccount(),
      ),
    );
  }
}