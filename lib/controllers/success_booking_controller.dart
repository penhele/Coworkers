import 'package:coworkers/config/enums.dart';
import 'package:coworkers/controllers/list_worker_controller.dart';
import 'package:coworkers/controllers/worker_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessBookingController extends GetxController {
  clear() {
    Get.delete<SuccessBookingController>(force: true);
  }

  toWorkerProfile(BuildContext context, String workerId) {
    final workerProfileController = Get.put(WorkerProfileController());
    workerProfileController.checkHiredBy(workerId);
    Navigator.popUntil(context, (route) => route.settings.name == AppRoute.workerProfile.name);
  }

  toListWorker(BuildContext context, String category) {
    final listWorkerController = Get.put(ListWorkerController());
    listWorkerController.fetchAvailable(category);
    Navigator.popUntil(context, (route) => route.settings.name == AppRoute.listWorker.name);
  }
}