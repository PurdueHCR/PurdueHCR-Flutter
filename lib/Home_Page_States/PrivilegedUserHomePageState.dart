//import 'package:flutter/material.dart';
//import 'package:purduehcr_web/Home_Page_States/BaseHomePageState.dart';
//import 'package:purduehcr_web/Main_Page_Fragments/ProfileFragment.dart';
//import 'package:purduehcr_web/Main_Page_Fragments/SubmitPointsFragment.dart';
//import 'package:purduehcr_web/Models/DrawerOption.dart';
//
//class PrivilegedUserHomePageState extends BaseHomePageState {
//
//  List<DrawerOption> getDrawerOptions(){
//    List<DrawerOption> options = new List();
//    options.add(DrawerOption("Profile"));
//    options.add(DrawerOption("Submit Points"));
//    return options;
//  }
//
//  Widget getBodyForIndex(int selectedIndex){
//    switch( selectedIndex){
//      case 1:
//        return SubmitPointsFragment();
//      default:
//        return ProfileFragment();
//    }
//  }
//
//}