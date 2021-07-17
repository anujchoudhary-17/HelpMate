import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/tagSession.dart';

class TestControllerForAnuj {
  TagSession tagSession = new TagSession();

  void writeTagData() {
    Tag tagData =
        new Tag(tagId: "0", tagName: "Matt_is_God", tagDescription: "OP");
    tagSession.pushNewTag(tagData);
  }

  Future getTagData() {
    return tagSession.getTag("0qnqZleV73ZMcNeDZ6fG");
    ;
  }

  Future? updateTagData() {
    Tag tag = Tag(tagId: "1", tagName: "Random", tagDescription: "RD");
    tagSession.pushUpdateTag(tag, "0qnqZleV73ZMcNeDZ6fG");
  }
}
