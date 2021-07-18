import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/comment_model.dart';
import 'package:help_mate/models/models.dart';

class CommentSession {
  CollectionReference commentCollection =
      FirebaseFirestore.instance.collection("commentCollection");

  Stream<List> commentsStream(String postId) {
    Stream<QuerySnapshot> snapshot = commentCollection
        .where('postId', isEqualTo: postId)
        .limit(20)
        .snapshots();

    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => Comment.fromJson(doc.data() as Map<String, dynamic>))
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

  Future updateCommentState(String commentId,List whoLiked ) async {

    commentCollection.doc(commentId).update({'whoLiked':whoLiked});
  }

  Future isUserLikedComment(String commentId, String userId) async {
    List postsList = [];

    try {
      await commentCollection
          .where("commentId", isEqualTo: commentId)
          .where("whoLiked", arrayContains: userId)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print("Element Added" + element.data().toString());
          postsList.add(element.data);
        });
      });
      return postsList.length==0 ? false : true;
    } catch (e) {
      print(e.toString());
      return false;
    }
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

  Future getAllComments(String userId) async {
    List postsList = [];

    try {
      await commentCollection
          .where("userId", isEqualTo: userId)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print("Element Added" + element.data().toString());

          postsList.add(element.data);
        });
      });
      return postsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future stupid(String userId) async {
    List postsList = [];

    try {
      await commentCollection
          .where(
            'userId',
          )
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print("Element Added" + element.data().toString());

          postsList.add(element.data);
        });
      });
      return postsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
