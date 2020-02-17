import 'dart:convert';

import 'package:firebase/firebase.dart' as fb;
import 'package:flutter/material.dart';

class FirebaseUtility{

  static FirebaseUtility instance = new FirebaseUtility();

  bool connectedToDatabase = false;

  static initializeFirebase(BuildContext context){
    if(fb.apps.isEmpty){
      print("needs init");
      DefaultAssetBundle.of(context).loadString("assets/flutter-firebase-config.json").then((data){
        print("has json");
        final projectInfo = json.decode(data)["project_info"];
        fb.initializeApp(
            apiKey: projectInfo["apiKey"],
            authDomain: projectInfo["authDomain"],
            databaseURL: projectInfo["databaseURL"],
            projectId: projectInfo["projectId"],
            storageBucket: projectInfo["storageBucket"]);
      }
      );
    }
  }

  String getName(){
    
  }
}