import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInCard extends StatefulWidget{
  LogInCard({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInCardState();
  }
}


class LogInCardState extends State<LogInCard>{

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(16, 25, 0, 0),
            child: Text(
              "Log in",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
              ),

            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your email address'
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your password'
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RaisedButton(
                        child: Text("Create an account"),
                      ),
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RaisedButton(
                        child: Text("Log in"),
                      ),
                    )
                  )
                ],
              ),
              FlatButton(
                child: Text("Forgot Password"),
              )
            ],
          )
        ],
      ),
    );
  }

}