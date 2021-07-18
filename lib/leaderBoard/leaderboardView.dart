import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  _LeaderboardViewState createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leaderboard"),),
      body: Container(
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
                          height: 60,
                          width: 400,

                          //  color: snapshot.data,
                          child: Column(
                              children: [
                                Container(
                                    height: 50,
                                    color: Colors.white,
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
