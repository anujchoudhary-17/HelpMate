import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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

              // MaterialButton(
              //     elevation: 0,
              //     height: 50,
              //
              //     onPressed: () async{
              //       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
              //
              //       if(googleUser != null) {
              //         final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
              //
              //         final AuthCredential credential = GoogleAuthProvider.credential(
              //             idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
              //
              //         final UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
              //         final User? user = authResult.user;
              //         singleton.currentUser = user;
              //         NavigationHelper().navigateToDashboard(context);
              //       }
              //     },
              //     color: Colors.lightGreen,
              //
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Text(
              //               "Sign in with google",
              //               style: TextStyle(color: Colors.white, fontSize: 20)
              //           ),
              //           Icon(Icons.arrow_forward_ios)
              //         ]
              //     )
              //
              // ),
              //
              // SizedBox(height: 30),


              MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () async {
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

                  color: Colors.blue,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),

              SizedBox(height: 20),


              MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () {
                    NavigationHelper().navigateToSplash(context);
                  },
                  color: Colors.red,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Back",
                            style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]
                  )

              ),

            ]
        )
    );


  }
}
