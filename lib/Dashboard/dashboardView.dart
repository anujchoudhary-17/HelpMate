import 'package:flutter/material.dart';
import 'package:help_mate/data/mock_data.dart';
import 'package:help_mate/models/models.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => print('Ask question'),
              icon: Icon(Icons.question_answer))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [],
      ),
      body: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (BuildContext buildContext, int index) {
            final comment = comments[index];

            return _DashItem(
              comment: comment,
            );
          }),
    );
  }
}

class _DashItem extends StatelessWidget {
  final Comment comment;

  const _DashItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 1.0,
      child: Container(
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Row(
          children: [Text(comment.commentContent)],
        ),
      ),
    );
  }
}
