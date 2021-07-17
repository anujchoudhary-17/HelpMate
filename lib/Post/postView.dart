import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_mate/common/NavigationHelper.dart';

final List<String> entries = <String>["I", "really", "really", "really", "really", "really", "really", "hate", "you"];
final List<int> colorCodes = <int>[600, 500, 100];

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<PostScreen> {
  List tagsList = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  final TextEditingController commentController = TextEditingController();

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText, obscured) {
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
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Question",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 28)
              ),

              SizedBox(height: 30),

              Text(
                  "Description",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16)
              ),

              SizedBox(height: 20),

              _buildTextField(commentController, Icons.account_circle, 'Comment', false),

              MaterialButton(
                  elevation: 0,
                  height: 50,

                  onPressed: () {
                    NavigationHelper().navigateToRegister(context);
                  },
                  color: Colors.red,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),

              SizedBox(height: 30),

              Text(
                  "Answers:",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16)
              ),


              SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        width: 200,
                        color: Colors.amber[index % 2 == 0 ? 100 : 50],
                        child: Center(child: Text('${entries[index]}')),
                      );
                    }
                )
              )

,


            ]
        )
    );
  }
}
