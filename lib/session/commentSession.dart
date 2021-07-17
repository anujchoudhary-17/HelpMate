import 'package:cloud_firestore/cloud_firestore.dart';


class CommentSession {
  CollectionReference commentCollection =
  FirebaseFirestore.instance.collection("commentSection");


}
