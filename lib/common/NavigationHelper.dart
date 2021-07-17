import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/testOnlyForAnuj.dart';

class NavigationHelper{



  void navigateToAnuj(BuildContext context)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TestForAnuj()),
    );
  }

}