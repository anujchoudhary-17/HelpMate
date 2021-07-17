class User {
  String email, name, country;
  String?  userId;

  User(
      {required this.email,
      this.userId,
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
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['name'] = this.name;
    data['country'] = this.country;

    return data;
  }
}
