import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/controllers/booking_controller.dart';
import 'package:coworkers/controllers/success_booking_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessBookingPage extends StatefulWidget {
  const SuccessBookingPage({super.key});

  @override
  State<SuccessBookingPage> createState() => _SuccessBookingPageState();
}

class _SuccessBookingPageState extends State<SuccessBookingPage> {
  final successBookingController = Get.put(SuccessBookingController());
  final bookingController = Get.put(BookingController());

  @override
  void dispose() {
    successBookingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/blur_purple.png',
            width: double.infinity,
            fit: BoxFit.cover, 
          ),
          Image.asset(
            'assets/blur_blue.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Success Hiring!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),
                DView.height(10),
                const Text(
                  'Time to expand you bussiness\nand grow confidenZtly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                DView.height(50),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 6
                        ),
                        shape: BoxShape.circle
                      ),
                      child: Image.network(
                        AppWrite.imageURL(bookingController.bookingDetail.worker!.image),
                        width: 136,
                        height: 136,
                        fit: BoxFit.cover,
                      ),
                    ),
                    hiredText(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget hiredText() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Transform.translate(
        offset: const Offset(0, 6),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4
            ),
            decoration: BoxDecoration(
              color: const Color(0xffBFA8FF),
              borderRadius: BorderRadius.circular(8)
            ),
            child: const Text(
              'HIRED',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
          ),
        ),
      ),
    );
  }
}