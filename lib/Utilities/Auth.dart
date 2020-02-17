/// PurdueHCR - 02/2020
/// This class handles the account log in and account creation for the user


import 'package:firebase_auth/firebase_auth.dart';


class Auth{

  static Auth instance = new Auth();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Given an email and password, try to log in. If the account was not
  /// logged in, a null will be returned
  Future<FirebaseUser> logIn(String email, String password) async {
    _auth.signInWithEmailAndPassword(email: email, password: password).then((user){
      return user;
    }).catchError((err)=> {
      throw(err.toString())
    });
  }

  ///Given an email and password, attempt to create an account
  Future<FirebaseUser> signUp(String email, String password) async {
    /// TODO: look at https://pub.dev/packages/firebase_auth to learn how to implement
    return null;
  }

  ///Returns true if the user is logged in with FirebaseAuth and false if the user is not
  bool isUserLoggedIn(){
    return _auth.currentUser() != null;
  }

}