import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:help_mate/Dashboard/dashboardController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/singleton.dart' as singleton;

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

DashboardController _controller=DashboardController();

bool _isLoadingState=true;

  List userData = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    fetchTags();
  }

  fetchTags() async {
    dynamic data = await _controller.getUserData(singleton.currentUser!.uid);

    if (data == null) {
      print("Unable to get data");
    } else {
      setState(() {
        userData = data;
        _isLoadingState=false;
      });
    }
  }

  NavigationHelper navigationHelper = NavigationHelper();
  @override
  Widget build(BuildContext context) {
    return _isLoadingState ? Center(child: CupertinoActivityIndicator()) : Scaffold(
      appBar: AppBar(title: Text("Hey"),),
      drawer: Drawer(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(userData[0]['name']),
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
