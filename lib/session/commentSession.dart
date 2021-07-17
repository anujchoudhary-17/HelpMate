import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/modelClasses/commentData.dart';

class CommentSession{
  CollectionReference commentCollection =
  FirebaseFirestore.instance.collection("commentCollection");


  Stream<List<CommentData>> tagIdStram(String tagId) {
    Stream<QuerySnapshot> snapshot = commentCollection
        .where('tagId', isEqualTo: tagId)
        .limit(20)
        .snapshots();

    return snapshot.map((qSnap) =>
        qSnap.docs.map((doc) => CommentData.fromJson(doc.data())).toList());
  }



  Future<String> pushNewComment(CommentData commentData) async {
    Map<String, dynamic> commentItemData = commentData.toJson();
    DocumentReference doc = await commentCollection.add(commentItemData);
    await commentCollection
        .doc(doc.id)
        .set({'commentId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }


  Future pushUpdateComment(CommentData commentData,String commentId) async
  {
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