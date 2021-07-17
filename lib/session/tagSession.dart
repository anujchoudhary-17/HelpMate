import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/modelClasses/tagData.dart';

class TagSession{
  CollectionReference tagCollection =
  FirebaseFirestore.instance.collection("tagCollection");





  Future<String> pushNewTag(TagData tagData) async {
    Map<String, dynamic> tagItemData = tagData.toJson();
    DocumentReference doc = await tagCollection.add(tagItemData);
    await tagCollection
        .doc(doc.id)
        .set({'tagId': doc.id}, SetOptions(merge: true));
    return doc.id.toString();
  }


  Future getTag(String tagId) async {
  tagCollection
        .doc(tagId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
        return documentSnapshot;
      } else {
        print('Document does not exist on the database');
      }
    });
  }


}