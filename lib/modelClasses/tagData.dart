class TagData {

  String tagId,tagName,tagDescription;


  TagData(this.tagName, this.tagDescription);

  TagData.fromJson(Map<String, dynamic> json) {
    tagId= json['tagId'];
    tagName= json['tagName'];
    tagDescription= json['tagDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagName'] = this.tagName;
    data['tagDescription']= this.tagDescription;
    return data;
  }
}
