class Tag {
  final String tagName, tagDescription, tagId;

  Tag(
      {required this.tagName,
      required this.tagDescription,
      required this.tagId});

  Tag.fromJson(Map<String, dynamic> json)
      : tagId = json['tagId'],
        tagDescription = json['tagDescription'],
        tagName = json['tagName'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagName'] = this.tagName;
    data['tagDescription'] = this.tagDescription;
    return data;
  }
}
