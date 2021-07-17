import 'package:help_mate/models/models.dart';
import 'package:help_mate/session/tagSession.dart';
import 'package:help_mate/session/userSession.dart';

class DashboardController {
  UserSession userSession = new UserSession();

  Future getUserData(String userId) {
    return userSession.getUser(userId);
  }

}
