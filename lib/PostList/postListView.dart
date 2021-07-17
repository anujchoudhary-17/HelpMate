import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/singleton.dart' as singleton;

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {

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
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28)
              ),

              SizedBox(height: 30),

              Text(
                  "FUCK", //(singleton.currentUser?.displayName != null ? singleton.currentUser?.displayName? : ""),
                  // How do optionals work??
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
                    NavigationHelper().navigateToLogin(context);
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
