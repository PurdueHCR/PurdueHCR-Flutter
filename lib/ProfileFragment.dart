
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileFragmentState();
  }
}

class ProfileFragmentState extends State<ProfileFragment>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UserInformationCard()
        ],
      )
    );
  }
}


class UserInformationCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UserInformationCardState();
  }
}

class UserInformationCardState extends State<UserInformationCard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: SizedBox(
        height: 150,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset('assets/main_icon.png',
                    height: 100,
                    width: 100,),
                    Text("Platinum - 4N")
                  ],
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text("First Last"),
                      Text("45 Points")
                    ],
                  ),
                )
              ],
            ),
            Text("#4 Overall      #1 Semester")
          ],
        ),
      )
    );
  }
}