import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/CreatePost/createPostController.dart';
import 'package:help_mate/common/NavigationHelper.dart';
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
      body: Container(
        child: Column(
          children: [
            _buildTextField(postContentController,"Type your question",false),
            MaterialButton(
                elevation: 0,
                height: 50,
                onPressed: () {
                  List<String>  tags = ["tag1","tag2"];
                  _controller.createNewPost(postContentController.text, DateTime.now().millisecondsSinceEpoch,tags, singleton.currentUser!.uid);
                  NavigationHelper().navigateToDashboard(context);
                },
                color: Colors.red,

                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "Post",
                          style: TextStyle(color: Colors.white, fontSize: 20)
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ]
                )

            ),
          ],
        ),
      ),
    );
  }

  _buildTextField(TextEditingController controller,
      String labelText, obscured) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        enableSuggestions: false,
        autocorrect: false,
        obscureText: obscured,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
