import 'package:flutter/material.dart';
import 'package:purduehcr_web/Utilities/Auth.dart';


class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  void launchLoginPage(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }

  void launchSignUpPage(BuildContext context){
    Navigator.pushNamed(context, '/signup');
  }

  void launchJoinHousePage(BuildContext context){
    Navigator.pushNamed(context, '/join');
  }


  @override
  Widget build(BuildContext context) {
    if(!Auth.instance.isUserLoggedIn()){
      Navigator.pushNamed(context, '/login');
      return Text("Log in");
    }
    else{
      return Scaffold(
        body: Center(
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Home"),
                RaisedButton(
                  child: Text("Login Page"),
                  onPressed: () => launchLoginPage(context),
                ),
                RaisedButton(
                  child: Text("Sign Up Page"),
                  onPressed: () => launchSignUpPage(context),
                ),
                RaisedButton(
                  child: Text("Join House Page"),
                  onPressed: () => launchJoinHousePage(context),
                )
              ],
            ),
          ),
        ),
      );
    }

  }
}