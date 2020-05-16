//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:purduehcr_web/HomePage.dart';
//import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
//import 'package:purduehcr_web/Login/LogInPage.dart';
//import 'package:purduehcr_web/Utilities/APIUtility.dart';
//import 'package:purduehcr_web/Utilities/FirebaseUtility.dart';
//
//class LoadingHomePageState extends State<HomePage> {
//
//  @override
//  void initState() {
//    super.initState();
//    initData(context).then((value){
//      //navigateToHomePage();
//    }).catchError((onError) {
//      print("GOT ERROR ON LOADING: "+onError.toString());
//      navigateToLoginPage();
//    });
//  }
//
//  void navigateToHomePage(){
//    Navigator.of(context).pushNamed('/login');
//  }
//
//  void navigateToLoginPage(){
//    Navigator.of(context).push(
//        new MaterialPageRoute(builder: (context) => new LogInPage())
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Purdue HCR"),
//      ),
//      body: Center(
//          child:CircularProgressIndicator()
//      ),
//
//    );
//  }
//
//  Future<void> initData(BuildContext context){
//    return FirebaseUtility.getCurrentUser(context).then((_){
//      navigateToHomePage();
//    }).catchError((error){
//      print("Got error on get User: "+error.toString());
//      navigateToLoginPage();
//    });
//  }
//
//}