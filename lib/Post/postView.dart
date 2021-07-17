import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/Post/postViewController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/session/postSession.dart';

class PostView extends StatefulWidget {
  final String postId;


  const PostView({Key? key, required this.postId}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState(postId: postId);
}

class _PostViewState extends State<PostView> {
  final TextEditingController commentController = TextEditingController();
  List postList=[];

PostViewController _contoller = PostViewController();
  String postId;

  bool _isLoadingState=true;
  PostSession _session= PostSession();

  @override
  void initState() {

    super.initState();
    fetchPostData();
  }

  _PostViewState({
    required this.postId,
  });


  fetchPostData() async {
    dynamic data = await _session.getPost(postId);

    if (data == null) {
      print("Unable to get data");
    } else {
      setState(() {
        postList = data;
        _isLoadingState=false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return _isLoadingState ? Center(child: CupertinoActivityIndicator())  :  Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(postList[0]['postContent'],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20)),
          SizedBox(height: 30),

          SizedBox(height: 20),
          _buildTextField(
              commentController, 'Comment', false),
          MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                NavigationHelper().navigateToRegister(context);
              },
              color: Colors.red,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Icon(Icons.arrow_forward_ios)
                  ])),
          SizedBox(height: 30),
          Text("Answers:",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16)),
          SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("commentCollection")
                    .where("postId", isEqualTo: postId)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: Text("No Data"),
                      ),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return Center(
                        child: Container(
                          height: 220,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          //  color: snapshot.data,
                          child: Container(
                            child: Text(
                              document['postContent'],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              )),
        ]));
  }

  _buildTextField(TextEditingController controller,
      String labelText, obscured) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
