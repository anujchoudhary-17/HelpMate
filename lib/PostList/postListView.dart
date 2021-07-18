import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/session/postSession.dart';
import 'package:help_mate/singleton.dart' as singleton;
import 'package:intl/intl.dart';

class PostListView extends StatefulWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  _PostListViewState createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {

  PostSession _postSession=PostSession();
  DateFormat f = new DateFormat('dd-MMM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("postCollection")
                    .where("whoPosted", isEqualTo: singleton.currentUser!.uid)
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
                      return GestureDetector(
                        onTap: (){
                          NavigationHelper().navigateToPostView(context, document['postId']);
                        },
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height * 0.125,
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  //  color: snapshot.data,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
                                        child: Text(
                                          // Max amount of 50 characters
                                          document['postContent'].substring(0, (50 < document['postContent'].length ? 50 : document['postContent'].length)) + "?",style: TextStyle(fontSize: 15),
                                        ),
                                      ),

                                      Container(
                                          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.question_answer, color: Colors.blue),
                                                SizedBox(width: 50),
                                                Text(
                                                  (f.format(new DateTime.fromMillisecondsSinceEpoch(document['timeStamp']))),style: TextStyle(fontSize: 15),
                                                ),
                                              ]
                                          )
                                      ),
                                    ],
                                  )
                              ),

                              SizedBox(height: 20)
                            ]
                          )

                        ),
                      );
                    }).toList(),
                  );
                },
              )),
        ],
      )),

    );
  }


}
