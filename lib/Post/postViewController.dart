import 'package:help_mate/session/postSession.dart';

class PostViewController{



  PostSession _session= PostSession();


  Future getPostData(String postId) async
  {
    print("Fetching data for"+postId);
    return await _session.getPost(postId);
  }
}