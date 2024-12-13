import 'package:coworkers/controllers/booking_controller.dart';
import 'package:coworkers/controllers/checkout_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final checkoutController = Get.put(CheckoutController());
  final bookingController = Get.put(BookingController());
  final userController = Get.put(UserController());

  @override
  void dispose() {
    checkoutController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}