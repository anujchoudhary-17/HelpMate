import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:help_mate/common/NavigationHelper.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  NavigationHelper navigationHelper = NavigationHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hey"),),
      drawer: Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('HelpMate'),
          ),
          ListTile(
            title: Text('Test Anuj'),
            onTap: () {
              navigationHelper.navigateToAnuj(context);
            },
          ),
          ListTile(
            title: Text('Post View'),
            onTap: () {
              navigationHelper.navigateToPostView(context);
            },
          ),
          ListTile(
            title: Text('Post View'),
            onTap: () {
              navigationHelper.navigateToPostListView(context);
            },
          ),
        ],
      ),
    ),);
  }


}
