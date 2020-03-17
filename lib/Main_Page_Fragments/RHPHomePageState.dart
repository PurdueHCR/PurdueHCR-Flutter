import 'package:flutter/material.dart';
import 'package:purduehcr_web/Main_Page_Fragments/BaseHomePageState.dart';
import 'package:purduehcr_web/Main_Page_Fragments/ProfileFragment.dart';
import 'package:purduehcr_web/Main_Page_Fragments/SubmitPointsFragment.dart';
import 'package:purduehcr_web/Models/DrawerOption.dart';

class RHPHomePageState extends BaseHomePageState {

  List<DrawerOption> getDrawerOptions(){
    List<DrawerOption> options = new List();
    options.add(DrawerOption("Profile"));
    options.add(DrawerOption("Submit Points"));
    options.add(DrawerOption("Approve Points"));
    return options;
  }

  Widget getBodyForIndex(int selectedIndex){
    switch( selectedIndex){
      case 1:
        return PointListFragment();
      default:
        return ProfileFragment();
    }
  }

}