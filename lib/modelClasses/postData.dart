class PostData {

  String postId,postContent,whoPosted;
  int timeStamp;
  List<String> tagIds;


  PostData.name(this.postId, this.postContent, this.timeStamp, this.tagIds,this.whoPosted);

  fromJson(Map<String, dynamic> json) {
    postId= json['postId'];
    postContent= json['postContent'];
    timeStamp= json['timeStamp'];
    tagIds= json['tagIds'];
    whoPosted=json['whoPosted'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['postContent'] = this.postContent;
    data['timeStamp']= this.timeStamp;
    data['tagIds']= this.tagIds;
    data['whoPosted'] = this.whoPosted;

    return data;
  }

}
