//import 'package:firebase/firebase.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:purduehcr_web/HomePage.dart';
//import 'package:purduehcr_web/User_Login_Creation/CreateAccountPage.dart';
//import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
//import 'package:purduehcr_web/Utilities/APIUtility.dart';
//import 'package:purduehcr_web/Utilities/FirebaseUtility.dart';
//
//class LogInCard extends StatefulWidget{
//
//  bool token;
//  LogInCard({Key key, this.token}) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return LogInCardState();
//  }
//}
//
//
//class LogInCardState extends State<LogInCard>{
//
//  String username;
//  String password;
//  String errorMessage = "";
//  int _loginButtonState = 0;
//  Future<dynamic> _logInFuture;
//
//  TextEditingController emailController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
//
//  void navigateToCreateAccountCard(){
//    Navigator.of(context).pushReplacement(
//        new MaterialPageRoute(builder: (context) => new CreateAccountPage())
//    );
//  }
//
//  void navigateToHomePage(){
//    Navigator.of(context).pop();
////    if(widget.token != null && widget.token){
////      print("Go to token");
////      Navigator.of(context).pushNamed("/token");
////    }
////    else{
////      print("Navigate to home page please");
////      Navigator.of(context).pushReplacement(
////          new MaterialPageRoute(builder: (context) => new HomePage())
////      );
////    }
//  }
//
//  ///
//  Future<dynamic> handleLogIn(String email, String password) {
//    if(email.isEmpty || password.isEmpty){
//      print("Needs log in info");
//      Future.delayed(Duration(seconds: 2), (){
//        setState(() {
//          _loginButtonState = 0;
//        });
//      });
//      setState(() {
//        errorMessage = "Please enter a username and password";
//      });
//      return Future.error("Please enter a username and password");
//    }
//    else{
//      print("Loggin in");
//      return FirebaseUtility.signIn(context, email, password).then((_){
//        return APIUtility.getUser().then((value){
//          print("GOT USER: "+value.toString());
//          Future.delayed(Duration(seconds: 2), (){
//            navigateToHomePage();
//          });
//          return Future.value(value);
//        });
//      }).catchError((error){
//        Future.delayed(Duration(seconds: 2), (){
//          setState(() {
//            _loginButtonState = 0;
//          });
//        });
//        print("ERROR AHHHHH: "+error.toString());
//        handleErrorCodeState(error);
//        return Future.error(error);
//      });
//    }
//
//  }
//
//  ///Sets the correct errorMessage on the screen for the given error
//  void handleErrorCodeState(error){
//    setState(() {
//      switch (error.code) {
//        case "auth/invalid-email":
//          errorMessage = "Your email address appears to be malformed.";
//          break;
//        case "auth/wrong-password":
//          errorMessage = "Please verify your email and password";
//          break;
//        case "auth/user-not-found":
//          errorMessage = "Please verify your email and password";
//          break;
//        case "auth/user-disabled":
//          errorMessage = "User with this email has been disabled.";
//          break;
//        case "auth/too-many-requests":
//          errorMessage = "Too many requests. Try again later.";
//          break;
//        case "auth/operation-not-allowed":
//          errorMessage = "Signing in with Email and Password is not enabled.";
//          break;
//        default:
//          errorMessage = error.toString();
//      }
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.fromLTRB(16, 25, 0, 0),
//            child: Text(
//              "Log in",
//              style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 32
//              ),
//
//            ),
//          ),
//
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
//                child: TextField(
//                  controller: emailController,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: 'Enter your email address'
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
//                child: TextField(
//                  obscureText: true,
//                  controller: passwordController,
//                  decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: 'Enter your password'
//                  ),
//                ),
//              ),
//              Visibility(
//                visible: errorMessage != "",
//                child: Padding(
//                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
//                  child: Text(errorMessage,
//                    style: TextStyle(
//                        color: Colors.red
//                    ),
//                  ),
//                )
//              ),
//
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//
//                  Expanded(
//                    child: Padding(
//                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                      child: RaisedButton(
//                        onPressed: (){
//                          navigateToCreateAccountCard();
//                        },
//                        child: Text("Create an account"),
//                      ),
//                    )
//                  ),
//                  Expanded(
//                    child: Padding(
//                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
//                      child: RaisedButton(
//                        onPressed: () {
//                          setState(() {
//                            _loginButtonState = 1;
//                            _logInFuture = handleLogIn(emailController.text, passwordController.text);
//                          });
//                        },
//                        child: _setupLogInButtonChild(),
//                      ),
//                    )
//                  )
//                ],
//              ),
//              FlatButton(
//                child: Text("Forgot Password"),
//              )
//            ],
//          )
//        ],
//      ),
//    );
//  }
//
//
//  Widget _setupLogInButtonChild(){
//    if(_loginButtonState == 0){
//      return new Text(
//        "Log In",
//      );
//    }
//    else {
//      return FutureBuilder(
//        future: _logInFuture,
//        builder: (context, snapshot) {
//          if(snapshot.hasData){
//            return Icon(Icons.done);
//          }
//          else if(snapshot.hasError){
//            return Icon(Icons.error);
//          }
//          else{
//            return Padding(
//              padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//              child: CircularProgressIndicator(),
//            );
//          }
//        },
//      );
//    }
//  }
//
//}