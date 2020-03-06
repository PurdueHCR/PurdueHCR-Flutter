import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseStatefulWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaseState();
  }

}

class BaseState extends State<BaseStatefulWidget>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sign UP Page"),
      ),
    );
  }



  Widget _createDesktopSite(){

    return null;
  }

  Widget _createSmallScreenSite(){
    return null;
  }
}