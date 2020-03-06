import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/ListDrawer.dart';
import 'package:purduehcr_web/Pages/LogInPage.dart';
import 'package:purduehcr_web/DisplayTypeUtil.dart';
import 'package:purduehcr_web/ProfileFragment.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((value){
      print("Got user");
      if(value == null){
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LogInPage())
        );
        print("Moving to Log in page");
      }
      else{
        print("User logged in");
      }
    }).catchError((onError){
      print("Error logging in");
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new LogInPage())
      );
    });
  }
  
  void launchLoginPage(){
    //Navigator.pushNamed(context, '/login');
  }

  void launchSignUpPage(){
   // Navigator.pushNamed(context, '/signup');
  }

  void launchJoinHousePage(){
    //Navigator.pushNamed(context, '/join');
  }


  @override
  Widget build(BuildContext context) {
    print("Start Build");
    final bool isDesktop = isDisplayDesktop(context);

    final body = ProfileFragment();

    if(isDesktop) {
      return Row(
        children: <Widget>[
          ListDrawer(),
          VerticalDivider(width: 1,),
          Expanded(
              child: Scaffold(
                  appBar: AppBar(
                    title: Text("Purdue HCR"),
                  ),
                  body: Center(
                      child:body
                  ),
              )
          )
        ],
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Purdue HCR"),
        ),
        body: Center(
          child:body
        ),
        drawer: ListDrawer(),

      );
    }
  }
}
