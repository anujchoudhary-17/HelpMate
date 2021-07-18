class Comment {
   String  postId, userId, commentContent;
   String? commentId,whoCommentedEmail;
   int timeStamp, likesOnComment;
   List<dynamic> tagIds;
       List<String> whoLiked;

  Comment(this.postId,
       this.userId,
       this.commentContent,
       this.timeStamp,
       this.likesOnComment,
       this.tagIds,
       this.whoLiked,this.whoCommentedEmail);

  Comment.fromJson(Map<String, dynamic> json)
      : commentId = json['commentId'],
        postId = json['postId'],
        userId = json['userId'],
        commentContent = json['commentContent'],
        timeStamp = json['timeStamp'],
        likesOnComment = json['likesOnComment'],
        tagIds = json['tagIds'],
        whoLiked = json['whoLiked'],
        whoCommentedEmail = json['whoCommentedEmail'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['commentContent'] = this.commentContent;
    data['timeStamp'] = this.timeStamp;
    data['likesOnComment'] = this.likesOnComment;
    data['tagIds'] = this.tagIds;
    data['whoLiked'] = this.whoLiked;
    data['whoCommentedEmail'] = this.whoCommentedEmail;

    return data;
  }
}
