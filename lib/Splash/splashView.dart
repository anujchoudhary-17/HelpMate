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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("images/logo.png")
          ),

          SizedBox(height: 40),

          Text(
            "Welcome to HelpMate",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 28)
          ),

          SizedBox(height: 30),

          Text(
              "And one-stop application for you to get your questions answered!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 16)
          ),

          SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  elevation: 0,
                  height: 50,

                  onPressed: () {
                    NavigationHelper().navigateToRegister(context);
                  },
                  color: Colors.lightBlueAccent,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Register",
                            style: TextStyle(color: Colors.black, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),

              SizedBox(width: 30),


              MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () {
                    NavigationHelper().navigateToLogin(context);
                  },
                  color: Colors.lightBlueAccent,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Sign in",
                            style: TextStyle(color: Colors.black, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),
            ]
          )



        ]
      )
    );
  }
}
