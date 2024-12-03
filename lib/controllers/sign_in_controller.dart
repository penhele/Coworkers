import 'package:coworkers/config/app_info.dart';
import 'package:coworkers/datasources%5B/user_datasource.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  clear() {
    Get.delete<SignInController>(force: true);
  }

  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  execute(BuildContext context) {
    if (edtEmail.text == '') {
      AppInfo.failed(context, 'Email wajib diisi');
      return;
    }

    if (!GetUtils.isEmail(edtEmail.text)) {
      AppInfo.failed(context, 'Email tidak valid');
      return;
    }

    if (edtPassword.text == '') {
      AppInfo.failed(context, 'Password wajib diisi');
      return;
    }

    if (edtPassword.text.length < 8) {
      AppInfo.failed(context, 'Password minimal 8 karakter');
      return;
    }

    loading = true;
    UserDatasource.signIn(
      edtEmail.text, 
      edtPassword.text
    ).then((value) {
      loading = false;
      value.fold(
        (message) {
          AppInfo.failed(context, message);
        }, 
        (data) {
          AppInfo.toastSuccess('SignIn berhasil');
          // save to session
        });
    });
  }
}