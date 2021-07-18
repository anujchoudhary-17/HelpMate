import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/Post/postViewController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:help_mate/session/postSession.dart';
import 'package:help_mate/singleton.dart' as singleton;

class PostView extends StatefulWidget {
  final String postId;

  const PostView({Key? key, required this.postId}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState(postId: postId);
}

class _PostViewState extends State<PostView> {
  final TextEditingController commentController = TextEditingController();
  List postList = [];

  PostViewController _contoller = PostViewController();
  String postId;

  bool _isLoadingState = true;
  PostSession _session = PostSession();

  @override
  void initState() {
    super.initState();
    fetchPostData();
  }

  _PostViewState({
    required this.postId,
  });

  fetchPostData() async {
    dynamic data = await _contoller.getPostData(postId);

    if (data == null) {
      print("Unable to get data");
    } else {
      setState(() {
        postList = data;
        _isLoadingState = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoadingState
        ? Center(child: CupertinoActivityIndicator())
        : Scaffold(
            appBar: AppBar(),
            drawer: DrawerWidget(context),
            body: Container(
              color: Colors.blue[300],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text("Question:",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    SizedBox(height: 10),
                    Text(postList[0]['postContent'],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    SizedBox(height: 20),

                    _buildTextField(commentController, "Enter your Answer", false),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {


                      if(commentController.text.toString().length!=0)
                        {

                          List<String> tags = ["tag1", "tag2"];
                          List<String> whoLiked = [];


                          _contoller.createNewComment(
                              postId,
                              singleton.currentUser!.uid,
                              commentController.text,
                              DateTime.now().millisecondsSinceEpoch,
                              0,
                              tags,
                              whoLiked);
                          commentController.text="";
                        }
                      },
                      child: Container(
                        child: Text(
                          "Share Answer",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    Center(
                      child: Text("Answers:",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    SizedBox(height: 20),

                    Expanded(
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
                                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *
                                      0.01,),
                                  child: Column(children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Expanded(
                                                flex: 4,
                                                child: Text("EMAIL HERE"),
                                              ),
                                              Expanded(
                                                flex: 6,
                                                child: Text(
                                                    document["commentContent"]),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    bool isCommentLiked =
                                                        document['whoLiked']
                                                            .contains(singleton
                                                                .currentUser!
                                                                .uid);
                                                    _contoller
                                                        .changeCommentState(
                                                            document[
                                                                'commentId'],
                                                            singleton
                                                                .currentUser!
                                                                .uid,
                                                            isCommentLiked,
                                                            document[
                                                                'whoLiked']);
                                                    _contoller
                                                        .changeLeaderboardState(
                                                            document['userId'],
                                                            isCommentLiked);
                                                  },
                                                  child: Icon(
                                                    Icons.thumb_up_alt,
                                                    color: document['whoLiked']
                                                            .contains(singleton
                                                                .currentUser!
                                                                .uid)
                                                        ? Colors.blue
                                                        : Colors.grey,
                                                    size: 36.0,
                                                  ),
                                                ),
                                              ),
                                            ])),
                                    //SizedBox(height: 5)
                                  ])),
                            );
                          }).toList(),
                        );
                      },
                    )),
                  ]),
            ));
  }

  _buildTextField(
      TextEditingController controller, String labelText, obscured) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(

          color: Colors.white, border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
