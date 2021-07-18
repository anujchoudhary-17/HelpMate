import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:intl/intl.dart';

class AllQuestionsView extends StatefulWidget {
  const AllQuestionsView({Key? key}) : super(key: key);

  @override
  _AllQuestionsViewState createState() => _AllQuestionsViewState();
}

class _AllQuestionsViewState extends State<AllQuestionsView> {


  DateFormat f = new DateFormat('dd-MMM-yyyy');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(context),
      appBar: AppBar(
        title: Text("All Questions"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("postCollection")
                    .orderBy("timeStamp", descending: true)
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
                        onTap: () {
                          NavigationHelper()
                              .navigateToPostView(context, document['postId']);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height *
                              0.015,horizontal: MediaQuery.of(context).size.width *
                              0.05,),
                          padding: EdgeInsets.all(10.0),
                          height: MediaQuery.of(context).size.height *
                              0.15,
                          width: MediaQuery.of(context).size.width *
                              0.9,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[200],

                            borderRadius: BorderRadius.all(Radius.circular(10),),
                          ),

                          //  color: snapshot.data,
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  document['postContent'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                Text((f.format(new DateTime.fromMillisecondsSinceEpoch(document['timeStamp']))),style: TextStyle(fontSize: 15),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
