
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/HomePage.dart';
import 'package:purduehcr_web/Models/DrawerOption.dart';
import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
import 'package:purduehcr_web/User_Login_Creation/LogInPage.dart';
import 'package:purduehcr_web/Utilities/APIUtility.dart';
import 'package:purduehcr_web/Utilities/DisplayTypeUtil.dart';

abstract class HomePageState extends State<HomePage> {
  PHCRUser.User user;
  int _selectedIndex;

  HomePageState() : super(){
    updateUser();
  }

  /// Get the user information from the API assuming the user is logged in
  void updateUser() async {
    APIUtility.getUser().then((updatedUser) {
      setState(() {
        user = PHCRUser.User.user;
      });
    })
        .catchError((err){
      print("Err on getUser(): "+err.toString());
      throw(err);
    });

  }

  /// Returns list of Tiles that are to be put on the side drawer
  List<DrawerOption> getDrawerOptions();

  /// Return the body fragment for the [selectedIndex] from the drawer list
  Widget getBodyForIndex(int selectedIndex);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    if(isDesktop) {
      return Row(
        children: <Widget>[
          _createDrawer(),
          VerticalDivider(width: 1,),
          Expanded(
              child: Scaffold(
                appBar: AppBar(
                  title: Text("Purdue HCR"),
                ),
                body: Center(
                    child:getBodyForIndex(_selectedIndex)
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
            child:getBodyForIndex(_selectedIndex)
        ),
        drawer: _createDrawer(),

      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkUserIsLoggedIn();
  }

  /// Method will check Firebase Auth and if user is not logged in,
  /// this method will transition to log in page
  void _checkUserIsLoggedIn(){
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


  /// Create the drawer for the home page
  Drawer _createDrawer(){

    List<Widget> drawerOptions = new List();
    List<DrawerOption> customDrawerOptions = getDrawerOptions();
    List<ListTile> drawerTiles = new List();
    for(int i = 0; i < customDrawerOptions.length; i++){
      drawerTiles.add(ListTile(
        selected: i == _selectedIndex,
        title: Text(customDrawerOptions[i].name),
        leading: customDrawerOptions[i].icon,
        onTap: (){
          setState(() {
            _selectedIndex = i;
          });
        },
      ));

    }

    drawerOptions.add(getDrawerHeader());
    drawerOptions.add(Divider());
    drawerOptions.addAll(drawerTiles);
    drawerOptions.add(Divider());
    drawerOptions.add(FlatButton(
        child: Text("Loggout"),
        onPressed: (){
          FirebaseAuth.instance.signOut();
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new LogInPage())
          );
        }),
    );

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: drawerOptions,
        ),
      ),
    );
  }

  // Create the header for the side menu
  Widget getDrawerHeader(){
    return ListTile(
      title: Text(
          "Item 1"
      ),
      subtitle: Text(
          "Item 2"
      ),
    );
  }

}