import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/modelClasses/commentData.dart';
import 'package:help_mate/modelClasses/postData.dart';

class PostSession {
  CollectionReference postCollection =
  FirebaseFirestore.instance.collection("postCollection");


  Stream<List<CommentData>> postIdStream(String postId) {
    Stream<QuerySnapshot> snapshot = postCollection
        .where('postId', isEqualTo: postId)
        .limit(20)
        .snapshots();

    return snapshot.map((qSnap) =>
        qSnap.docs.map((doc) => CommentData.fromJson(doc.data())).toList());
  }


  Future<String> pushNewPost(PostData postData) async {
    Map<String, dynamic> postItemData = postData.toJson();
    DocumentReference doc = await postCollection.add(postItemData);
    await postCollection
        .doc(doc.id)
        .set({'postId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }


  Future pushUpdatePost(PostData postData, String postId) async
  {
    Map<String, dynamic> data = postData.toJson();
    postCollection.doc(postId).update(data);
  }


  Future getPost(String postId) async {
    postCollection
        .doc(postId)
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


  Future getAllPosts(String whoPosted) async {
    List postsList = [];


    try {
      await postCollection.where("whoPosted", isEqualTo: whoPosted).get().then((
          querySnapshot) {
        querySnapshot.docs.forEach((element) {
          postsList.add(element.data);
        });
      });
    }
    catch (e) {
    print(e.toString());
    return null;
    }


  }


}