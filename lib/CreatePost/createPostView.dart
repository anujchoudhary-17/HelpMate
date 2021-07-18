import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/CreatePost/createPostController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:help_mate/singleton.dart' as singleton;

class CreatePostView extends StatefulWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  _CreatePostViewState createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {

  TextEditingController postContentController =TextEditingController();
  CreatePostController _controller = CreatePostController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(context),
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            _buildTextField(postContentController,"Type your question",false),
            GestureDetector(
              onTap: (){
                List<String>  tags = ["tag1","tag2"];
                _controller.createNewPost(postContentController.text, DateTime.now().millisecondsSinceEpoch,tags, singleton.currentUser!.uid);
                NavigationHelper().navigateToDashboard(context);
              },
              child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Post",
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTextField(TextEditingController controller,
      String labelText, obscured) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: MediaQuery.of(context).size.height*0.05),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(20))),

      child: TextField(
        controller: controller,
        style: TextStyle(),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
