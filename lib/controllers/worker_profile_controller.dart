import 'package:get/get.dart';

class WorkerProfileController extends GetxController {
  clear() {
    Get.delete<WorkerProfileController>(force: true);
  }

  // recuiter
  final _tenanId = ''.obs;
  String get tenantId => _tenanId.value;
  set tenantId(String n) => _tenanId.value = n;

  checkHiredBy(String workerId) {}
}