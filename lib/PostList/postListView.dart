import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostListView extends StatefulWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  _PostListViewState createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Center(
        child: Text("Hi I am Post List View"),
      ),),

    );
  }
}
