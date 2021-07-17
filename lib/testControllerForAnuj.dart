import 'package:help_mate/modelClasses/tagData.dart';
import 'package:help_mate/session/tagSession.dart';


class TestControllerForAnuj{

  TagSession tagSession = new TagSession();

  void writeTagData()
  {
    TagData tagData= new TagData("Matt_is_God", "OP");
    tagSession.pushNewTag(tagData);
  }
  
  
  Future getTagData()
  {

    return tagSession.getTag("0qnqZleV73ZMcNeDZ6fG");;
  }


  Future updateTagData()
  {
    TagData tag= TagData("Hey","Anuj");
    tagSession.pushUpdateTag(tag,"0qnqZleV73ZMcNeDZ6fG");
  }

}