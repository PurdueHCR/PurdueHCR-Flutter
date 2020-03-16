import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/User_Login_Creation/CreateAccountPage.dart';
import 'package:purduehcr_web/Models/User.dart' as PHCRUser;

class LogInCard extends StatefulWidget{

  LogInCard({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInCardState();
  }
}


class LogInCardState extends State<LogInCard>{

  String username;
  String password;

  TextEditingController emailController = TextEditingController();
  TextEditingController pswdController = TextEditingController();

  void navigateToCreateAccountCard(){
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new CreateAccountPage())
    );
  }

  Future<void> logIn(BuildContext context, String email, String password) async {

    FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password: password).then((user){
      print("Complete");
      if(user != null){
        print("Success log in");
        FirebaseAuth.instance.currentUser().then((user){
          user.getIdToken().then((value) {
            print("GOt token: "+value.token);
            PHCRUser.User.user.firebaseToken = value.token;
          })
          .catchError((err){
            FirebaseAuth.instance.signOut();
            print("FAILED TO GET ID TOKEN. SO LOGGED OUT");
          });

        }).catchError((err){
          FirebaseAuth.instance.signOut();
          print("FAILED TO GET CURRENT USER. SO LOGGED OUT");
        });
        Navigator.of(context).pushReplacementNamed('/');
      }else{
        print("Could not sign in");
      }
    }
    ).catchError((err){
      print("ERROR: "+ err);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 25, 0, 0),
            child: Text(
              "Log in",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
              ),

            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your email address'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: TextField(
                  obscureText: true,
                  controller: pswdController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password'
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RaisedButton(
                        onPressed: (){
                          navigateToCreateAccountCard();
                        },
                        child: Text("Create an account"),
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RaisedButton(
                        onPressed: () {
                          logIn(context, emailController.text, pswdController.text);
                        },
                        child: Text("Log in"),
                      ),
                    )
                  )
                ],
              ),
              FlatButton(
                child: Text("Forgot Password"),
              )
            ],
          )
        ],
      ),
    );
  }

}