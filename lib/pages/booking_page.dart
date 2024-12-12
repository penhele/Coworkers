import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/booking_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:coworkers/models/worker_model.dart';
import 'package:coworkers/widgets/header_worker_left.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.worker});
  final WorkerModel worker;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final bookingController = Get.put(BookingController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    bookingController.initBookingModel(userController.data.$id!, widget.worker);
    super.initState();
  }

  @override
  void dispose() {
    bookingController.clear();
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
                      )),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HeaderWorkerLeft(
                      title: "Booking Worker",
                      subtitle: 'Grow your bussiness today',
                      iconLeft: 'assets/ic_back.png',
                      functionLeft: () {
                        Navigator.pop(context);
                      }
                    ),
                    DView.empty(),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
