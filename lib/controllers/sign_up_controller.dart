import 'package:coworkers/config/app_info.dart';
import 'package:coworkers/datasources/user_datasource.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  clear() {
    Get.delete<SignUpController>(force: true);
  }

  final edtName = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  execute(BuildContext context) {
    if (edtName.text == '') {
      AppInfo.failed(context, 'Name wajib diisi');
      return;
    }

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
    UserDatasource.signUp(
      edtName.text, 
      edtEmail.text, 
      edtPassword.text
    ).then((value) {
      loading = false;
      value.fold(
        (message) {
          AppInfo.failed(context, message);
        }, 
        (data) {
          AppInfo.toastSuccess('SignUp berhasil');
        });
    });
  }
}