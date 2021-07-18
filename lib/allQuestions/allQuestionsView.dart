import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:help_mate/session/postSession.dart';
import 'package:intl/intl.dart';

class AllQuestionsView extends StatefulWidget {
  const AllQuestionsView({Key? key}) : super(key: key);

  @override
  _AllQuestionsViewState createState() => _AllQuestionsViewState();
}

class _AllQuestionsViewState extends State<AllQuestionsView> {
  DateFormat f = new DateFormat('dd-MMM-yyyy');

  TextEditingController tagsEditingContoller = TextEditingController();

  PostSession _postSession = PostSession();
  List userPostData = [];
 bool _isLoadingState = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllData();

  }


  fetchAllData() async {
    dynamic upd = await _postSession.getAllHelpMatePosts();

    if (upd == null) {
      print("Unable to get data");
    } else {
      setState(() {
        userPostData = upd;
        _isLoadingState = false;
      });
    }
  }

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
              height: 20,
            ),
            _buildTextField(
                tagsEditingContoller, "Enter Tags and Filter questions", false),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child:

              ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: updatePostList().length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        NavigationHelper()
                            .navigateToPostView(context, updatePostList()[index]['postId']);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical:
                          MediaQuery.of(context).size.height * 0.015,
                          horizontal:
                          MediaQuery.of(context).size.width * 0.05,
                        ),
                        padding: EdgeInsets.all(10.0),
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),

                        //  color: snapshot.data,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                updatePostList()[index]['postContent'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (f.format(
                                    new DateTime.fromMillisecondsSinceEpoch(
                                        updatePostList()[index]['timeStamp']))),
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),






              // StreamBuilder(
              //   stream: tagsEditingContoller.text.isNotEmpty
              //       ? FirebaseFirestore.instance
              //           .collection("postCollection")
              //           .where("tagIds",
              //               arrayContains: tagsEditingContoller.text)
              //           .orderBy("timeStamp", descending: true)
              //           .snapshots()
              //       : FirebaseFirestore.instance
              //           .collection("postCollection")
              //           .orderBy("timeStamp", descending: true)
              //           .snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (!snapshot.hasData) {
              //       return Container(
              //         child: Center(
              //           child: Text("No Data"),
              //         ),
              //       );
              //     }
              //
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //
              //     return ListView(
              //       children: snapshot.data!.docs.map((document) {
              //         return GestureDetector(
              //           onTap: () {
              //             NavigationHelper()
              //                 .navigateToPostView(context, document['postId']);
              //           },
              //           child: Container(
              //             margin: EdgeInsets.symmetric(
              //               vertical:
              //                   MediaQuery.of(context).size.height * 0.015,
              //               horizontal:
              //                   MediaQuery.of(context).size.width * 0.05,
              //             ),
              //             padding: EdgeInsets.all(10.0),
              //             height: MediaQuery.of(context).size.height * 0.15,
              //             width: MediaQuery.of(context).size.width * 0.9,
              //             decoration: BoxDecoration(
              //               color: Colors.lightBlue[200],
              //               borderRadius: BorderRadius.all(
              //                 Radius.circular(10),
              //               ),
              //             ),
              //
              //             //  color: snapshot.data,
              //             child: Center(
              //               child: Column(
              //                 children: [
              //                   Text(
              //                     document['postContent'],
              //                     style: TextStyle(
              //                         fontSize: 20,
              //                         fontWeight: FontWeight.bold),
              //                   ),
              //                   Text(
              //                     (f.format(
              //                         new DateTime.fromMillisecondsSinceEpoch(
              //                             document['timeStamp']))),
              //                     style: TextStyle(fontSize: 15),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }

  _buildTextField(
      TextEditingController controller, String labelText, obscured) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.05),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        controller: controller,
        style: TextStyle(),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        onChanged: (String val) async {
          setState(() {
      print("Value is changing"+tagsEditingContoller.text);
          });
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }


  List updatePostList()
  {
    List newUserList=[];
    if(tagsEditingContoller.text.isNotEmpty)
      {
        for(int i=0;i<userPostData.length;i++)
          {
            if(userPostData[i]["tagIds"].contains(tagsEditingContoller.text))
              {
                newUserList.add(userPostData[i]);
                print("Data adding is "+userPostData[i].toString());
              }
            else
              continue;
          }
        return newUserList;
      }
    else
     return userPostData;
  }
}
