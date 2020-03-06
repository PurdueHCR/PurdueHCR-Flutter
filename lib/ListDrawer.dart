import 'package:flutter/material.dart';

class ListDrawer extends StatefulWidget {
  const ListDrawer({Key key, this.lastFocusNode}) : super(key: key);

  final FocusNode lastFocusNode;

  @override
  _ListDrawerState createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Item 1"
              ),
              subtitle: Text(
                  "Item 2"
              ),
            ),
            Divider(),
            ListTile(
              enabled: true,
              selected: 0 == selectedItem,
              leading: Icon(Icons.account_circle),
              title: Text(
                  "Profile"
              ),
              onTap: () {
                setState(() {
                  selectedItem = 0;
                });
              },
            ),
            ListTile(
              enabled: true,
              selected: 1 == selectedItem,
              leading: Icon(Icons.add),
              title: Text(
                  "Submit Points"
              ),
              onTap: () {
                setState(() {
                  selectedItem = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}