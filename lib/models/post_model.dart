class Post {
  String? postId;
  String postContent, whoPosted;
  int timeStamp;
  List<String> tagIds;

  Post(this.postContent, this.timeStamp, this.tagIds,
      this.whoPosted);

  Post.fromJson(Map<String, dynamic> json) :
    postId = json['postId'],
    postContent = json['postContent'],
    timeStamp = json['timeStamp'],
    tagIds = json['tagIds'],
    whoPosted = json['whoPosted'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postContent'] = this.postContent;
    data['timeStamp'] = this.timeStamp;
    data['tagIds'] = this.tagIds;
    data['whoPosted'] = this.whoPosted;

    return data;
  }
}
