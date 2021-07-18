import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavigationHelper.dart';
import 'package:help_mate/singleton.dart' as singleton;


NavigationHelper navigationHelper = NavigationHelper();


Widget DrawerWidget(BuildContext context)
{
  return Drawer(

    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text("HelpMate",style: TextStyle(color: Colors.white,fontSize: 30),),
        ),
        ListTile(
          title: Text('Dashboard',style: TextStyle(fontSize: 20),),
          onTap: () {
            navigationHelper.navigateToDashboard(context);
          },
        ),
        ListTile(
          title: Text('Post List View',style: TextStyle(fontSize: 20),),
          onTap: () {
            navigationHelper.navigateToPostListView(context);
          },
        ),
        ListTile(
          title: Text('Create Post',style: TextStyle(fontSize: 20),),
          onTap: () {
            navigationHelper.navigateToCreatePost(context);
          },
        ),
        ListTile(
          title: Text('Leaderboard',style: TextStyle(fontSize: 20),),
          onTap: () {
            navigationHelper.navigateToLeaderboard(context);
          },
        ),
        ListTile(
          title: Text('LogOut',style: TextStyle(fontSize: 20),),
          onTap: () {
            navigationHelper.navigateToRegister(context);
          },
        ),
      ],
    ),
  );
}