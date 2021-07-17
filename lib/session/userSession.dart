import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/models.dart';

class UserSession {
  CollectionReference userCollection =
  FirebaseFirestore.instance.collection("userCollection");


  Future<String> pushNewUser(User userData) async {
    Map<String, dynamic> userItemData = userData.toJson();
    DocumentReference doc = await userCollection.add(userItemData);
    return doc.id.toString();
  }


  Future getUser(String userId) async {

    List tagsList = [];

    try {
      await userCollection.where("userId",isEqualTo: userId).get().then((querySnapshot) {
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
