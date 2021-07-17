import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/comment_model.dart';
import 'package:help_mate/models/models.dart';

class CommentSession {
  CollectionReference commentCollection =
      FirebaseFirestore.instance.collection("commentCollection");

  Stream<List<Comment>> commentsStream(String postId) {
    Stream<QuerySnapshot> snapshot = commentCollection
        .where('postId', isEqualTo: postId)
        .limit(20)
        .snapshots();


    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => Comment.fromJson(doc.data() as Map<Comment,dynamic>))
        .toList());
  }

  Future<String> pushNewComment(Comment commentData) async {
    Map<String, dynamic> commentItemData = commentData.toJson();
    DocumentReference doc = await commentCollection.add(commentItemData);
    await commentCollection
        .doc(doc.id)
        .set({'commentId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }

  Future pushUpdateComment(Comment commentData, String commentId) async {
    Map<String, dynamic> data = commentData.toJson();
    commentCollection.doc(commentId).update(data);
  }

  Future getComment(String commentId) async {
    commentCollection
        .doc(commentId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        return documentSnapshot.data();
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
