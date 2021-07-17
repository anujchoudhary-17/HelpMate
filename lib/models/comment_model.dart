class Comment {
  final String  postId, userId, commentContent;
  final String? commentId;
  final int timeStamp, likesOnComment;
  final List<String> tagIds, whoLiked;

  Comment.name(
      { this.commentId,
      required this.postId,
      required this.userId,
      required this.commentContent,
      required this.timeStamp,
      required this.likesOnComment,
      required this.tagIds,
      required this.whoLiked});

  Comment.fromJson(Map<Comment, dynamic> json)
      : commentId = json['commentId'],
        postId = json['postId'],
        userId = json['userId'],
        commentContent = json['commentContent'],
        timeStamp = json['timeStamp'],
        likesOnComment = json['likesOnComment'],
        tagIds = json['tagIds'],
        whoLiked = json['whoLiked'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['postId'] = this.postId;
    data['userId'] = this.userId;
    data['commentContent'] = this.commentContent;
    data['timeStamp'] = this.timeStamp;
    data['likesOnComment'] = this.likesOnComment;
    data['tagIds'] = this.tagIds;
    data['whoLiked'] = this.whoLiked;

    return data;
  }
}
