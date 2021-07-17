import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:help_mate/Register/registerController.dart';
import 'package:help_mate/main.dart';
import 'package:help_mate/singleton.dart' as singleton;
import 'package:help_mate/common/NavigationHelper.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterController _controller = RegisterController();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }



  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Choose a method to register",
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
              _buildTextField(nameController, Icons.account_circle, 'Name', false),

              SizedBox(height: 20),

              _buildTextField(emailController, Icons.account_circle, 'Email', false),

              SizedBox(height: 20),

              _buildTextField(passwordController, Icons.lock, "Password", true),

              SizedBox(height: 20),

              _buildTextField(countryController, Icons.lock, "Country", false),

              SizedBox(height: 30),


              MaterialButton(
                  elevation: 0,
                  height: 50,
                  onPressed: () async {
                    User? firebaseUser;
                    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                    firebaseUser = userCredential.user;
                    singleton.currentUser = firebaseUser;
                    _controller.writeUserData(countryController.text.trim(), emailController.text.trim(), nameController.text, singleton.currentUser!.uid);
                    print(firebaseUser?.email);
                    NavigationHelper().navigateToDashboard(context);
                  },

                  color: Colors.blue,

                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "Register",
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
}
