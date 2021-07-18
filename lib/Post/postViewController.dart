import 'package:help_mate/models/comment_model.dart';
import 'package:help_mate/session/commentSession.dart';
import 'package:help_mate/session/leaderboardSession.dart';
import 'package:help_mate/session/postSession.dart';
import 'package:help_mate/session/userSession.dart';


class PostViewController{

  UserSession userSession = new UserSession();
  Future getUserData(String userId) {
    return userSession.getUser(userId);
  }

  PostSession _session= PostSession();

  CommentSession _commentSession= CommentSession();
  LeaderboardSession _leaderboardSession= LeaderboardSession();


  Future getPostData(String postId) async
  {
    print("Fetching data for"+postId);
    return await _session.getPost(postId);
  }

  Future isCommentLiked(String commentId,String userId) async
  {
    return await _commentSession.isUserLikedComment(commentId,userId);
  }

  void changeCommentState(String commentId,String userId,bool isCommentLiked,List whoLiked) async
  {
    if(isCommentLiked)
      whoLiked.remove(userId);
    else
      whoLiked.add(userId);
    return await _commentSession.updateCommentState(commentId,whoLiked);
  }


  void changeLeaderboardState(String userId,bool isCommentLiked) async
  {

    print('Hey I am in Leader');
    if(isCommentLiked)
      return await _leaderboardSession.updateLeaderboardItem(userId,-1);
    else
      return await _leaderboardSession.updateLeaderboardItem(userId,1);



  }
  void createNewComment(String postId,
      String userId,
      String commentContent,
      int timeStamp,
      int likesOnComment,
      List<String> tagIds,
      List<String> whoLiked) {
    Comment commentData = Comment(postId,userId,commentContent,timeStamp,likesOnComment,tagIds,whoLiked);
    _commentSession.pushNewComment(commentData);
  }



}