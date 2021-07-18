import 'package:help_mate/models/leaderboardModel.dart';
import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/leaderboardSession.dart';
import 'package:help_mate/session/tagSession.dart';
import 'package:help_mate/session/userSession.dart';

class RegisterController {
  UserSession userSession = new UserSession();
  LeaderboardSession leaderboardSession = new LeaderboardSession();

  void writeUserData(String country,String email,String name,String userId) {
    User userData =
    new User(country: country,email: email,name: name,userId: userId);
    userSession.pushNewUser(userData);
  }
  void writeUserDataOnLeaderboard(String country,int totalLikes,String name,String userId) {
    LeaderboardModel leaderboardModel =
    new LeaderboardModel.name(totalLikes,userId,country,name);
    leaderboardSession.pushNewLeaderboardItem(leaderboardModel);
  }
  Future getUserData(String userId) {
    return userSession.getUser(userId);

  }

}
