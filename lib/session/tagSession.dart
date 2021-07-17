import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/models.dart';

class TagSession {
  CollectionReference tagCollection =
      FirebaseFirestore.instance.collection("tagCollection");

  Stream<List<Tag>> tagIdStram(String tagId) {
    Stream<QuerySnapshot> snapshot =
        tagCollection.where('tagId', isEqualTo: tagId).limit(20).snapshots();

    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => Tag.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<String> pushNewTag(Tag tagData) async {
    Map<String, dynamic> tagItemData = tagData.toJson();
    DocumentReference doc = await tagCollection.add(tagItemData);
    await tagCollection
        .doc(doc.id)
        .set({'tagId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }

  Future pushUpdateTag(Tag tagData, String tagId) async {
    Map<String, dynamic> data = tagData.toJson();
    tagCollection.doc(tagId).update(data);
  }

  Future getTag(String tagId) async {
    List tagsList = [];

    try {
      await tagCollection.doc(tagId).get().then((querySnapshot) {
        if (querySnapshot.exists)
          return querySnapshot.data();
        else
          return null;
      });
      return tagsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getAllTags() async {
    List tagsList = [];

    try {
      await tagCollection.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tagsList.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });

      return tagsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
