class CommentData {
  String commentId, postId,userId,commentContent;
  int timeStamp,likesOnComment;
  List<String> tagIds, whoLiked;


  CommentData.name(
      this.commentId,
      this.postId,
      this.userId,
      this.commentContent,
      this.timeStamp,
      this.likesOnComment,
      this.tagIds,
      this.whoLiked);

  fromJson(Map<String, dynamic> json) {
    commentId= json['commentId'];
    postId= json['postId'];
    userId= json['userId'];
    commentContent= json['commentContent'];
    timeStamp= json['timeStamp'];
    likesOnComment=json['likesOnComment'];
    tagIds = json['tagIds'];
    whoLiked=json['whoLiked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['postId'] = this.postId;
    data['userId']= this.userId;
    data['commentContent']= this.commentContent;
    data['timeStamp']= this.timeStamp;
    data['likesOnComment'] = this.likesOnComment;
    data['tagIds']= this.tagIds;
    data['whoLiked']= this.whoLiked;

    return data;
  }

}
