import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_mate/common/drawerWidget.dart';
import 'package:help_mate/main.dart';
import 'package:help_mate/singleton.dart' as singleton;
import 'package:help_mate/common/NavigationHelper.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  List tagsList = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText, obscured) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height *
          0.025,),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.blue[200], border: Border.all(color: Colors.blue)),
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: Container(
          color: Colors.blue[500],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Choose a method to sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 28)
                ),

                SizedBox(height: 30),

                Text(
                    "(More will be added in the future!)",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16)
                ),

                SizedBox(height: 30),

                _buildTextField(nameController, Icons.account_circle, 'Email', false),

                SizedBox(height: 20),

                _buildTextField(passwordController, Icons.lock, "Password", true),

                SizedBox(height: 30),


                GestureDetector(
                    onTap: () async {
                      User? firebaseUser;
                      final userCredential = await firebaseAuth
                          .signInWithEmailAndPassword(
                          email: nameController.text.trim(),
                          password: passwordController.text.trim()
                      );
                      firebaseUser = userCredential.user;
                      singleton.currentUser = firebaseUser;
                      print(firebaseUser?.email);
                      NavigationHelper().navigateToDashboard(context);

                    },
                    child: Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

                ),

                SizedBox(height: 20),

              ]
          ),
        )
    );


  }
}
