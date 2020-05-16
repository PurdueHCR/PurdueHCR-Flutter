import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purduehcr_web/Login/LogInPage.dart';


class TokenTestPage extends StatefulWidget {
  TokenTestPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TokenTestPageState();
  }

}

class TokenTestPageState extends State<TokenTestPage> {

  String token = "";

  void getToken() async{
    FirebaseAuth.instance.currentUser().then((user){
      user.getIdToken().then((value) {
        setState(() {
          token = value.token;
        });
      })
      .catchError((err){
        setState(() {
          token = "Error: "+err.toString();
        });
      });

    }).catchError((err){
      setState(() {
        token = "Error: "+err.toString();
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((value){
      if(value == null){
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new LogInPage())
        );
        print("BLAH BLABH LBAH");
      }
    });
    getToken();
    return Scaffold(
      appBar: AppBar(
        title: Text("Get the Token"),
      ),
      body: Builder(
        builder: (context) =>
            Center(
              child: (token != "")? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Bearer "+token),
                  RaisedButton(
                    child: Text("Copy token"),
                    onPressed: () {
                      print("Please try to print");
                      Clipboard.setData(ClipboardData(text: "Bearer "+token));
                      final snackBar = SnackBar(
                        content: Text('Copied to Clipboard'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      );
                      Scaffold.of(context).showSnackBar(snackBar);

                    },
                  )
                ],
              ): Text("Loading"),
            )
      )
    );

  }
}