import 'package:coworkers/controllers/user_controller.dart';
import 'package:coworkers/models/user_model.dart';
import 'package:d_session/d_session.dart';
import 'package:get/get.dart';

class AppSession {
  static Future<bool> setUser(Map<String, dynamic> user) async {
    bool success = await DSession.setUser(user);

    if (success) {
      final userController = Get.put(UserController());
      userController.data = UserModel.fromJson(Map.from(user));
    }

    return success;
  }

  static Future<Map?> getUser(Map user) async {
    Map? mapUser = await DSession.getUser();

    if (mapUser != null) {
      final userController = Get.put(UserController());
      userController.data = UserModel.fromJson(Map.from(user));
    }

    return mapUser;
  }

  static Future<bool> removeUser(Map<String, dynamic> user) async {
    bool success = await DSession.removeUser();

    if (success) {
      final userController = Get.put(UserController());
      userController.data = UserModel();
    }

    return success;
  }
}