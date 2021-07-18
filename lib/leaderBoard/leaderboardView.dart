import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/drawerWidget.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  _LeaderboardViewState createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(context),
      appBar: AppBar(title: Text("Leaderboard"),),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(child: StreamBuilder(

              stream: FirebaseFirestore.instance
                  .collection("leaderboardCollection").orderBy('totalLikes',descending: true)
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

                          height: MediaQuery.of(context).size.height*0.1,
                          width: MediaQuery.of(context).size.width*0.95,

                          child: Center(
                            child: Column(
                                children: [
                                  Container(

                                      height: MediaQuery.of(context).size.height*0.075,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                          border: Border.all(

                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 4,
                                              child: Text(document['country']),

                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(document["name"]),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text("Total Likes : "+document["totalLikes"].toString()),
                                            ),
                                          ]
                                      )
                                  ),
                                  //SizedBox(height: 5)
                                ]
                            ),
                          )
                      ),
                    );
                  }).toList(),
                );
              },
            ),),
          ],

        ),
      ),
    );
  }
}
