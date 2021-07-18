import 'package:help_mate/leaderBoard/leaderboardModel.dart';
import 'package:help_mate/session/commentSession.dart';
import 'package:help_mate/session/userSession.dart';

class LeaderboardController
{

  UserSession userSession = new UserSession();
  CommentSession commentSession = new CommentSession();




  List users=[];
//------users=controller.getAllUserData();
  List<LeaderboardModel> leaderBoardList=[];

  Future getAllUserData() {
   // leaderBoardList.add(new LeaderboardModel.name(0, userId, country, name));
    return userSession.getAllUsers();
  }

  Future getUserCommentData(String userId) {

    return commentSession.getAllComments(userId);
  }



}