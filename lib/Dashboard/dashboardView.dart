import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/Dashboard/dashboardController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/singleton.dart' as singleton;

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardView> {


  DashboardController _controller = DashboardController();

  bool _isLoadingState=true;

  List userData = [];
  List userPostData = [];
  List userCommentData = [];
  String userId=singleton.currentUser!.uid;

NavigationHelper navigationHelper = NavigationHelper();
  @override
  void initState() {
    super.initState();
    fetchAllData();
  }



  fetchAllData() async {
    dynamic ud = await _controller.getUserData(userId);
    dynamic upd=await _controller.getUserPostData(userId);
    dynamic ucd = await _controller.getUserCommentData(userId);

    if (ud == null || upd == null || ucd == null) {
      print("Unable to get data");
    } else {
      setState(() {
        userData = ud;
        userPostData=upd;
        userCommentData = ucd;

        _isLoadingState=false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return _isLoadingState ? Scaffold(body: Center(child: CupertinoActivityIndicator())) : Scaffold(


        appBar: AppBar(),
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
                  navigationHelper.navigateToPostView(context,"69tlrcCVvXWwubZdfpAq");
                },
              ),
              ListTile(
                title: Text('Post List View'),
                onTap: () {
                  navigationHelper.navigateToPostListView(context);
                },
              ),
              ListTile(
                title: Text('Create Post'),
                onTap: () {
                  navigationHelper.navigateToCreatePost(context);
                },
              ),
              ListTile(
                title: Text('Leaderboard'),
                onTap: () {
                  navigationHelper.navigateToLeaderboard(context);
                },
              ),
            ],
          ),
        ),




        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Welcome ${userData[0]['name']}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28,fontWeight: FontWeight.bold)
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
                        "Ask : Answer ratio",
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),

                    SizedBox(height: 10),

                    CircularProgressIndicator(
                        value: userCommentData.length.toDouble()/(userCommentData.length.toDouble()+userPostData.length.toDouble()),
                        backgroundColor: Colors.white,
                        semanticsLabel: "Are you a giver or a taker?"
                    ),

                    SizedBox(height: 8),

                    Text(
                        "Are you a giver or a taker?",
                        style: TextStyle(color: Colors.white, fontSize: 15)
                    ),
                  ]
              ),

              SizedBox(height: 20),

              Column(
                children: [
                  Text(
                      "Your Country",
                      style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)
                  ),


                  SizedBox(height: 8),

                  Text(
                      "${userData[0]['country']}",
                      style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold)
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
                            "${userPostData.length}",
                            style: TextStyle(color: Colors.white, fontSize: 32)
                        ),

                        Text(
                            "Questions asked",
                            style: TextStyle(color: Colors.white, fontSize: 15)
                        ),
                      ]
                    ),

                    SizedBox(width: 90),

                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "${userCommentData.length}",
                              style: TextStyle(color: Colors.white, fontSize: 32)
                          ),

                          Text(
                              "Questions answered",
                              style: TextStyle(color: Colors.white, fontSize: 15)
                          ),
                        ]
                    )
                  ]
              ),

              SizedBox(height: 20),

              MaterialButton(
                  elevation: 0,
                  height: 50,

                  onPressed: () {
                    NavigationHelper().navigateToCreatePost(context);
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  MaterialButton(
                      elevation: 0,
                      height: 50,

                      onPressed: () {
                        navigationHelper.navigateToPostListView(context);
                      },
                      color: Colors.blueAccent,

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "My Questions",
                                style: TextStyle(color: Colors.white, fontSize: 20)
                            ),
                            Icon(Icons.arrow_forward_ios)
                          ]
                      )

                  ),

                  SizedBox(width: 40),

                  MaterialButton(
                      elevation: 0,
                      height: 50,

                      onPressed: () {
                        NavigationHelper().navigateToAllQuestions(context);
                      },
                      color: Colors.blueAccent,

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                "All Questions",
                                style: TextStyle(color: Colors.white, fontSize: 20)
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
