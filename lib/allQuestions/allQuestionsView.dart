import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';

class AllQuestionsView extends StatefulWidget {
  const AllQuestionsView({Key? key}) : super(key: key);

  @override
  _AllQuestionsViewState createState() => _AllQuestionsViewState();
}

class _AllQuestionsViewState extends State<AllQuestionsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("All Questions"),),body: Container(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("postCollection").orderBy("timeStamp",descending: true)
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
            ),
          )
        ],
      ),
    ),);
  }
}
