import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:help_mate/models/leaderboardModel.dart';
import 'package:help_mate/models/models.dart';

class LeaderboardSession {
  CollectionReference leaderboardCollection =
  FirebaseFirestore.instance.collection("leaderboardCollection");


  Future<String> pushNewLeaderboardItem(LeaderboardModel leaderboardModel) async {
    Map<String, dynamic> userItemData = leaderboardModel.toJson();

    await leaderboardCollection.doc(leaderboardModel.userId).set(userItemData);
    return leaderboardModel.userId.toString();
  }


  Future getLeaderboardData(String userId) async {
    List userData = [];

    try {
      await leaderboardCollection.where("userId",isEqualTo: userId).get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          userData.add(element.data());
          print("Element Added" + element.data().toString());
        });
      });
      return userData;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  Future updateLeaderboardItem(String userId,int value) async {

    List leaderBoardList = [];
  int totalLikes=0;
    try {
      await leaderboardCollection
          .where("userId", isEqualTo: userId)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          print("Element Added" + element.data().toString());

          leaderBoardList.add(element.data());
        });
      });
totalLikes=int.parse(leaderBoardList[0]['totalLikes'].toString());

      leaderboardCollection.doc(userId).update({'totalLikes': (totalLikes+value)});

    } catch (e) {
      print(e.toString());
      return null;
    }




  }

}
