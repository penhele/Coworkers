import 'package:coworkers/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _date = UserModel().obs;
  UserModel get data => _date.value;

  set data(UserModel n) => _date.value = n;
}