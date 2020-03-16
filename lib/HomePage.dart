import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/Main_Page_Fragments/SubmitPointsFragment.dart';
import 'package:purduehcr_web/User_Login_Creation/LogInPage.dart';
import 'package:purduehcr_web/Utilities/DisplayTypeUtil.dart';
import 'package:purduehcr_web/Main_Page_Fragments/ProfileFragment.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  int selectedDrawerItem = 0;


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

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    final body = (selectedDrawerItem == 0) ? ProfileFragment() : PointListFragment();

    if(isDesktop) {
      return Row(
        children: <Widget>[
          createDrawer(),
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
        drawer: createDrawer(),

      );
    }
  }

  Drawer createDrawer(){
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                  "Item 1"
              ),
              subtitle: Text(
                  "Item 2"
              ),
            ),
            Divider(),
            ListTile(
              enabled: true,
              selected: 0 == selectedDrawerItem,
              leading: Icon(Icons.account_circle),
              title: Text(
                  "Profile"
              ),
              onTap: () {
                setState(() {
                  selectedDrawerItem = 0;
                });
              },
            ),
            ListTile(
              enabled: true,
              selected: 1 == selectedDrawerItem,
              leading: Icon(Icons.add),
              title: Text(
                  "Submit Points"
              ),
              onTap: () {
                setState(() {
                  selectedDrawerItem = 1;
                });
              },
            ),
            Divider(),
            FlatButton(
                child: Text("Loggout"),
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => new LogInPage())
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
