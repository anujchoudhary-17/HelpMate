import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/singleton.dart' as singleton;

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardView> {
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
              Text(
                  "Welcome ${singleton.currentUser?.email}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28)
              ),

              SizedBox(height: 30),

              Text(
                  "Here's some information about you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16)
              ),


              SizedBox(height: 20),


              Column(
                  children: [
                    Text(
                        "Liked percentage",
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),

                    SizedBox(height: 10),

                    CircularProgressIndicator(
                        value: 0.5,
                        semanticsLabel: "Answer like percentage"
                    ),

                    SizedBox(height: 8),

                    Text(
                        "50% of your answers have been liked",
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                  ]
              ),

              SizedBox(height: 20),

              Column(
                children: [
                  Text(
                      "Answered percentage",
                      style: TextStyle(color: Colors.white, fontSize: 15)
                  ),

                  SizedBox(height: 10),

                  CircularProgressIndicator(
                      value: 1,
                      semanticsLabel: "Answered percentage"
                  ),

                  SizedBox(height: 8),

                  Text(
                      "100% of your questions have been answered!",
                      style: TextStyle(color: Colors.white, fontSize: 15)
                  ),
                ]
              ),

              SizedBox(height: 50),

              Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "5000",
                            style: TextStyle(color: Colors.white, fontSize: 32)
                        ),

                        Text(
                            "questions asked",
                            style: TextStyle(color: Colors.white, fontSize: 15)
                        ),
                      ]
                    ),

                    SizedBox(width: 90),

                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "4",
                              style: TextStyle(color: Colors.white, fontSize: 32)
                          ),

                          Text(
                              "questions answered",
                              style: TextStyle(color: Colors.white, fontSize: 15)
                          ),
                        ]
                    )
                  ]
              ),

              SizedBox(height: 60),

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
                            "Add Question",
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),

              SizedBox(height: 20),

              MaterialButton(
                  elevation: 0,
                  height: 50,

                  onPressed: () {
                    NavigationHelper().navigateToRegister(context);
                  },
                  color: Colors.blueAccent,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "View Questions",
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
