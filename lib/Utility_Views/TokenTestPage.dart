import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purduehcr_web/BLoCs/authentication/authentication_bloc.dart';
import 'package:purduehcr_web/BLoCs/authentication/authentication_state.dart';
import 'package:purduehcr_web/Utilities/DisplayTypeUtil.dart';


import 'PhcrDrawer.dart';


class TokenTestPage extends StatefulWidget {
  TokenTestPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TokenTestPageState();
  }

}

class TokenTestPageState extends State<TokenTestPage> {
  AuthenticationAuthenticated auth;

  @override
  void initState() {
    super.initState();
    auth = BlocProvider.of<AuthenticationBloc>(context).state;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = isDisplayDesktop(context);

    if(isDesktop) {
      return Scaffold(
          body: Row(
            children: [
              PhcrDrawer("Token"),
              Expanded(
                child: Column(
                  children: [
                    AppBar(
                      title: Text("Purdue HCR"),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              )
            ],
          )
      );
    }
    else{
      return Scaffold(
          appBar: AppBar(
            title: Text("Purdue HCR"),
          ),
          drawer: PhcrDrawer("Token"),
          body: _buildBody()
      );
    }


  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Bearer " + auth.token),
          RaisedButton(
            child: Text("Copy token"),
            onPressed: () {
              print("Please try to print");
              Clipboard.setData(ClipboardData(text: "Bearer " + auth.token));
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
      ),
    );
  }

}