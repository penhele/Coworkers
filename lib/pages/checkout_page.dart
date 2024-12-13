import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/booking_controller.dart';
import 'package:coworkers/controllers/checkout_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:coworkers/widgets/header_worker_left.dart';
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
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            height: 172,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.bgHeader,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    )
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderWorkerLeft(
                        title: "Checkout",
                        subtitle: 'Start hiring and grow',
                        iconLeft: 'assets/ic_back.png',
                        functionLeft: () {
                          Navigator.pop(context);
                        }
                      ),
                      // worker(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}