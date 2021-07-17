import 'package:help_mate/models/comment_model.dart';
import 'package:help_mate/session/commentSession.dart';
import 'package:help_mate/session/postSession.dart';

class PostViewController{



  PostSession _session= PostSession();

  CommentSession _commentSession= CommentSession();


  Future getPostData(String postId) async
  {
    print("Fetching data for"+postId);
    return await _session.getPost(postId);
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