import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/commentSession.dart';
import 'package:help_mate/session/postSession.dart';
import 'package:help_mate/session/tagSession.dart';
import 'package:help_mate/session/userSession.dart';

class DashboardController {
  UserSession userSession = new UserSession();
  PostSession postSession = new PostSession();
  CommentSession commentSession = new CommentSession();


  Future getUserData(String userId) {
    print("user id received ${userId}");
    return userSession.getUser(userId);
  }

  Future getUserCommentData(String userId) {

    return commentSession.getAllComments(userId);
  }

  Future getUserPostData(String userId) {
    return postSession.getAllPosts(userId);

  }


}
