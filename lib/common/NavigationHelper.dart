import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/testOnlyForAnuj.dart';
import 'package:help_mate/Splash/splashView.dart';
import 'package:help_mate/Register/registerView.dart';
import 'package:help_mate/Login/loginView.dart';
import 'package:help_mate/PostList/postListView.dart';
import 'package:help_mate/Dashboard/dashboardView.dart';

class NavigationHelper{
  void navigateToAnuj(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestForAnuj()),
    );
  }

  void navigateToSplash(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Splash()),
    );
  }

  void navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void navigateToPostList(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostList()),
    );
  }

  void navigateToDashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardView()),
    );
  }

}