import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/postSession.dart';

class CreatePostController {
  PostSession _postSession = PostSession();

  void createNewPost(String postContent, int timeStamp, List<String> tagIds,
      String whoPosted) {
    Post postData = Post(postContent, timeStamp, tagIds, whoPosted);
    _postSession.pushNewPost(postData);
  }
}
