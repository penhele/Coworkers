import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/config/app_format.dart';
import 'package:coworkers/controllers/booking_controller.dart';
import 'package:coworkers/controllers/checkout_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:coworkers/widgets/header_worker_left.dart';
import 'package:d_view/d_view.dart';
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
                  offset: const Offset(0, 55),
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
                      payments(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(0, 60),
            child: walletBox()
          ),
          DView.height(90)
        ],
      ),
    );
  }
  
  Widget payments() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: checkoutController.payments.map((e) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, 
                      width: 5
                    ),
                    color: e['is_active'] ? Theme.of(context).primaryColor : const Color(0xffF2F2F2),
                  ),
                  child: Image.asset(e['image']),
                ),
                DView.height(8),
                Text(
                  e['label'],
                  style: TextStyle(
                      color: e['is_active'] ? Colors.black : const Color(0xffA7A8B3),
                    fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
  
  Widget walletBox() {
    return Stack(
      children: [
        Image.asset(
          'assets/bg_card.png'
        ),
        Positioned(
          left: 60,
          top: 110,
          child: Text(
            AppFormat.price(45988),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ), 
        ),
        Positioned(
          left: 60,
          right: 60,
          bottom: 106,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return Text(
                  userController.data.name ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                );
              }),
              const Text(
                '12/27',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}