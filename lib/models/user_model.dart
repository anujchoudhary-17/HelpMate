class User {
  String email, userId, name, country;

  User(
      {required this.email,
      required this.userId,
      required this.name,
      required this.country});

  fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userId = json['userId'];
    name = json['name'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['country'] = this.country;

    return data;
  }
}
