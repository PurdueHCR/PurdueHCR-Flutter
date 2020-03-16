//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:purduehcr_web/User_Login_Creation/LogInPage.dart';
//
//class SideDrawer extends Drawer {
//  int selectedItem = 0;
//
//  @override
//  Widget build(BuildContext context) {
//    final textTheme = Theme.of(context).textTheme;
//    return Drawer(
//      child: SafeArea(
//        child: ListView(
//          children: [
//            ListTile(
//              title: Text(
//                "Item 1"
//              ),
//              subtitle: Text(
//                  "Item 2"
//              ),
//            ),
//            Divider(),
//            ListTile(
//              enabled: true,
//              selected: 0 == selectedItem,
//              leading: Icon(Icons.account_circle),
//              title: Text(
//                  "Profile"
//              ),
//              onTap: () {
//                setState(() {
//                  selectedItem = 0;
//                });
//              },
//            ),
//            ListTile(
//              enabled: true,
//              selected: 1 == selectedItem,
//              leading: Icon(Icons.add),
//              title: Text(
//                  "Submit Points"
//              ),
//              onTap: () {
//                setState(() {
//                  selectedItem = 1;
//                });
//              },
//            ),
//            FlatButton(
//                child: Text("Loggout"),
//                onPressed: (){
//                  FirebaseAuth.instance.signOut();
//                  Navigator.of(context).pushReplacement(
//                      new MaterialPageRoute(builder: (context) => new LogInPage())
//                  );
//                }
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}