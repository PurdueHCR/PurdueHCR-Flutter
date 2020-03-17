import 'package:flutter/material.dart';
import 'package:purduehcr_web/Main_Page_Fragments/RHPHomePageState.dart';
import 'package:purduehcr_web/Models/User.dart' as PHCRUser;
import 'package:purduehcr_web/Main_Page_Fragments/ResidentHomePageState.dart';
import 'package:purduehcr_web/Models/UserPermissionLevel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    switch(PHCRUser.User.user.permissionLevel){
      case UserPermissionLevel.RHP:
        return RHPHomePageState();
      default:
        return ResidentHomePageState();
    }
  }

}
