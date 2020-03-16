import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purduehcr_web/Main_Page_Fragments/ProfileFragment.dart';

class PointListFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return PointListFragmentState();
  }
  
}

class PointListFragmentState extends State<PointListFragment> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("Item "+index.toString()),
            );
          }
        )
    );
  }
  
}