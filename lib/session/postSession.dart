import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/models.dart';

class PostSession {
  CollectionReference postCollection =
      FirebaseFirestore.instance.collection("postCollection");

  Stream<List> postsStream(String userId) {
    Stream<QuerySnapshot> snapshot = postCollection
        .where('whoPosted', isEqualTo: userId)
        .limit(20)
        .snapshots();

    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => Post.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<String> pushNewPost(Post postData) async {
    Map<String, dynamic> postItemData = postData.toJson();
    DocumentReference doc = await postCollection.add(postItemData);
    await postCollection
        .doc(doc.id)
        .set({'postId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }

  Future pushUpdatePost(Post postData, String postId) async {
    Map<String, dynamic> data = postData.toJson();
    postCollection.doc(postId).update(data);
  }

  Future getPost(String postId) async {


    List postList = [];

    try {
      await postCollection.where("postId",isEqualTo: postId).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          postList.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });
      return postList;
    } catch (e) {
      print(e.toString());
      return null;
    }



  }

  Future getAllPosts(String whoPosted) async {
    List postsList = [];

    try {
      await postCollection
          .where("whoPosted", isEqualTo: whoPosted)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          postsList.add(element.data);
        });
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
