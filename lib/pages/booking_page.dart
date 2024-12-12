import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/config/app_format.dart';
import 'package:coworkers/config/appwrite.dart';
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
                Transform.translate(
                  offset: Offset(0, 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderWorkerLeft(
                        title: "Booking Worker",
                        subtitle: 'Grow your bussiness today',
                        iconLeft: 'assets/ic_back.png',
                        functionLeft: () {
                          Navigator.pop(context);
                        }
                      ),
                      worker(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  Widget worker() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black12,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Image.network(
                AppWrite.imageURL(widget.worker.image),
                width: 70,
                height: 70,
              ),
              DView.width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.worker.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),
                        ),
                        DView.width(4),
                        Image.asset(
                          'assets/ic_verified.png',
                          width: 16,
                          height: 16,
                        )
                      ],
                    ),
                    DView.height(2),
                    Row(
                      children: [
                        Image.asset(
                          'assets/ic_star_small.png',
                          width: 16,
                          height: 16,
                        ),
                        DView.height(4),
                        Text(
                          widget.worker.rating.toString(),
                          style: const TextStyle(
                            color: Colors.black
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              DView.width(12),
              Row(
                children: [
                  Text(
                    AppFormat.price(widget.worker.hourRate),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                    ),
                  ),
                  const Text('/hr')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
