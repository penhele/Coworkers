import 'package:coworkers/models/booking_model.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  clear() {
    Get.delete<OrderController>(force: true);
  }

  final _selected = 'In Progress'.obs;
  String get selected => _selected.value;
  set selected(String n) => _selected.value = n;

  final _inProgress = <BookingModel>[].obs;
  List<BookingModel> get inProgress => _inProgress;

  final _completed = <BookingModel>[].obs;
  List<BookingModel> get completed => _completed;

  final _statusInProgress = ''.obs;
  String get statusInProgress =>_statusInProgress.value;
  set statusInProgress(String n) => _statusInProgress.value = n;

  final _statusCompleted = ''.obs;
  String get statusCompleted =>_statusCompleted.value;
  set statusCompleted(String n) => _statusCompleted.value = n;

  init() {
    fetchInProgress();
    fetchCompleted();
  }

  fetchInProgress() {}
  fetchCompleted() {}
  setCompleted() {}
}