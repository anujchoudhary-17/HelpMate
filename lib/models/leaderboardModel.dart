class LeaderboardModel
{
  int totalLikes;
  String? userId;
  String name,country;

  LeaderboardModel.name(this.totalLikes, this.userId,this.country,this.name);

  LeaderboardModel.fromJson(Map<String, dynamic> json):
    totalLikes = json['totalLikes'],
    userId = json['userId'],
    name = json['name'],
    country = json['country'];


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['totalLikes'] = this.totalLikes;
    data['name'] = this.name;
    data['country'] = this.country;
    return data;
  }

}