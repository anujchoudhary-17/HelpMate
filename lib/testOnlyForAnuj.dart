import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/testControllerForAnuj.dart';

class TestForAnuj extends StatefulWidget {
  const TestForAnuj({Key key}) : super(key: key);

  @override
  _TestForAnujState createState() => _TestForAnujState();
}

class _TestForAnujState extends State<TestForAnuj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hey"),),
      body: Container(
        color: Colors.grey[500],
        child: Column(

          children: [
            OutlinedButton(
              onPressed: () {
                print('Received click');
                TestControllerForAnuj().writeTagData();
              },
              child: const Text('Click me to Send Tag Data'),
            ),
          ],
        ),
      ),
    );
  }
}
