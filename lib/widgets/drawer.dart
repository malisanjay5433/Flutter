import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://scontent-bom1-1.xx.fbcdn.net/v/t1.6435-9/141866877_5159178924122503_179522740122536072_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=e3f864&_nc_ohc=yfTXL7M45TAAX9bpwB_&_nc_ht=scontent-bom1-1.xx&oh=5435b668ba135aaf36799a0238ca849c&oe=60BD9CB9";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("Sanjay Mali"),
              accountEmail: Text("malisanjay5433@gmail.com"),
              currentAccountPicture:
                  CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white),
            title: Text(
              "Home",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Projects",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
            ListTile(
            leading: Icon(CupertinoIcons.at, color: Colors.white),
            title: Text(
              "Contact",
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
