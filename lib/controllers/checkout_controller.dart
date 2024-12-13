import 'package:coworkers/config/app_info.dart';
import 'package:coworkers/datasources/booking_datasource.dart';
import 'package:coworkers/models/booking_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  clear() {
    Get.delete<CheckoutController>(force: true);
  }

  final payments = [
    {
      'image': 'assets/ic_wallet_payment.png',
      'label': 'Wallet',
    },
    {
      'image': 'assets/ic_master_card.png',
      'label': 'CC',
    },
    {
      'image': 'assets/ic_paypal.png',
      'label': 'PayPal',
    },
    {
      'image': 'assets/ic_other.png',
      'label': 'Other',
    },
  ];

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool n) => _loading.value = n;

  execute(BuildContext context, BookingModel bookingDetail) {
    BookingDatasource.checkout(bookingDetail).then((value) {
      value.fold(
        (message) => AppInfo.failed(context, message),
        (data) {
          AppInfo.success(context, 'Berhasil');
        },
      );
    });
  }
}