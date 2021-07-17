import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/modelClasses/tagData.dart';

class TagSession {
  CollectionReference tagCollection =
      FirebaseFirestore.instance.collection("tagCollection");

  Stream<List<TagData>> tagIdStram(String tagId) {
    Stream<QuerySnapshot> snapshot =
        tagCollection.where('tagId', isEqualTo: tagId).limit(20).snapshots();

    return snapshot.map((qSnap) => qSnap.docs
        .map((doc) => TagData.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<String> pushNewTag(TagData tagData) async {
    Map<String, dynamic> tagItemData = tagData.toJson();
    DocumentReference doc = await tagCollection.add(tagItemData);
    await tagCollection
        .doc(doc.id)
        .set({'tagId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }

  Future pushUpdateTag(TagData tagData, String tagId) async {
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
