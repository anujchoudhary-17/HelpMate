import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/tagSession.dart';
import 'package:help_mate/session/userSession.dart';

class RegisterController {
  UserSession userSession = new UserSession();

  void writeUserData(String country,String email,String name,String userId) {
    User userData =
    new User(country: country,email: email,name: name,userId: userId);
    userSession.pushNewUser(userData);
  }

  Future getUserData(String userId) {
    return userSession.getUser(userId);

  }

}
