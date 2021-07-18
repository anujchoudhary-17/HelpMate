import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/Dashboard/dashboardController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:help_mate/singleton.dart' as singleton;

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<DashboardView> {
  DashboardController _controller = DashboardController();

  bool _isLoadingState = true;

  List userData = [];
  List userPostData = [];
  List userCommentData = [];
  String userId = singleton.currentUser!.uid;

  NavigationHelper navigationHelper = NavigationHelper();

  @override
  void initState() {
    super.initState();
    fetchAllData();
  }

  fetchAllData() async {
    dynamic ud = await _controller.getUserData(userId);
    dynamic upd = await _controller.getUserPostData(userId);
    dynamic ucd = await _controller.getUserCommentData(userId);

    if (ud == null || upd == null || ucd == null) {
      print("Unable to get data");
    } else {
      setState(() {
        userData = ud;
        userPostData = upd;
        userCommentData = ucd;

        _isLoadingState = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoadingState
        ? Scaffold(body: Center(child: CupertinoActivityIndicator()))
        : Scaffold(
            drawer: DrawerWidget(context),
            appBar: AppBar(),
            body:
                Container(
                  color: Colors.white,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
              Text("Welcome ${userData[0]['name']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Text("Here's some information about you!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              Column(children: [
                  Text("Question : Answer ratio",
                      style: TextStyle( fontSize: 15)),
                  SizedBox(height: 10),
                  CircularProgressIndicator(
                      value: (userCommentData.length.toDouble() +
                          userPostData.length.toDouble()) == 0 ? 0 : userCommentData.length.toDouble() /
                          (userCommentData.length.toDouble() +
                              userPostData.length.toDouble()),
                      backgroundColor: Colors.grey[300],
                      semanticsLabel: "Are you a giver or a taker?"),
                  SizedBox(height: 8),
                  Text("Are you a giver or a taker?",
                      style: TextStyle( fontSize: 15)),
              ]),
              SizedBox(height: 40),
              Column(children: [

                  Text("Your Country",
                      style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("${userData[0]['country']}",
                      style: TextStyle(

                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
              ]),
              SizedBox(height: 50),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("${userPostData.length}",
                        style: TextStyle( fontSize: 32)),
                    Text("Questions asked",
                        style: TextStyle(fontSize: 15)),
                  ]),
                  SizedBox(width: 90),
                  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("${userCommentData.length}",
                        style: TextStyle( fontSize: 32)),
                    Text("Questions answered",
                        style: TextStyle( fontSize: 15)),
                  ])
              ]),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
                    0.05,),
                child: MaterialButton(
                      elevation: 0,
                      height: 50,
                      onPressed: () {
                        NavigationHelper().navigateToCreatePost(context);
                      },
                      color: Colors.lightBlue[300],
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Add Question",
                                style:
                                    TextStyle( fontSize: 20)),
                            Icon(Icons.arrow_forward_ios)
                          ])),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
                      0.025,),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(
                        onTap: () {
                          navigationHelper.navigateToPostListView(context);
                        },
                        child: Container(

                            child: Text("My Questions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),



                    GestureDetector(
                        onTap: () {
                          NavigationHelper().navigateToAllQuestions(context);
                        },
                        child: Container(

                            child: Text("All Questions",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))),

                  ]),
              )
            ]),
                ));
  }
}
