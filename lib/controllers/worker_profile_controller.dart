import 'package:coworkers/datasources/booking_datasource.dart';
import 'package:get/get.dart';

class WorkerProfileController extends GetxController {
  clear() {
    Get.delete<WorkerProfileController>(force: true);
  }

  // recuiter
  final _recruiterId = ''.obs;
  String get recruitertId => _recruiterId.value;
  set recruitertId(String n) => _recruiterId.value = n;

  checkHiredBy(String workerId) {
    BookingDatasource.checkHiredBy(workerId).then((value) {
      value.fold(
        (message) => recruitertId = 'Available',
        (booking) {
          recruitertId = booking.userId;
        }
      );
    });
  }
}