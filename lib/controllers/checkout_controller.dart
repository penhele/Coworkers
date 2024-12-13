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

  execute() {

  }
}