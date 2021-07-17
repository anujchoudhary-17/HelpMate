import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //TestControllerForAnuj controller = TestControllerForAnuj();

  //TagSession session = TagSession();

  List tagsList = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => "Item $i");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to HelpMate",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28)
          ),

          SizedBox(height: 30),

          Text(
              "And one-stop application for you to get your questions answered!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16)
          ),

          SizedBox(height: 20),

          MaterialButton(
              elevation: 0,
              height: 50,

              onPressed: () {
                NavigationHelper().navigateToRegister(context);
              },
              color: Colors.lightGreen,

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 20)
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ]
              )

          ),

          SizedBox(height: 30),


          MaterialButton(
            elevation: 0,
            height: 50,
            onPressed: () {

            },
            color: Colors.lightGreen,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 20)
                ),
                Icon(Icons.arrow_forward_ios)
              ]
            )

          ),

        ]
      )
    );
  }
}
