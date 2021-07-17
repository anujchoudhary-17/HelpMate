class TagData {
  final String tagName, tagDescription, tagId;

  TagData(
      {required this.tagName,
      required this.tagDescription,
      required this.tagId});

  TagData.fromJson(Map<String, dynamic> json)
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
