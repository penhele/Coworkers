import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/config/appwrite.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:coworkers/controllers/worker_profile_controller.dart';
import 'package:coworkers/models/worker_model.dart';
import 'package:coworkers/widgets/header_worker.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerProfilePage extends StatefulWidget {
  const WorkerProfilePage({super.key, required this.worker});
  final WorkerModel worker;

  @override
  State<WorkerProfilePage> createState() => _WorkerProfilePageState();
}

class _WorkerProfilePageState extends State<WorkerProfilePage> {
  final workerProfileController = Get.put(WorkerProfileController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    workerProfileController.checkHiredBy(widget.worker.$id);
    super.initState();
  }
  
  @override
  void dispose() {
    workerProfileController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  height: 172,
                  decoration: const BoxDecoration(
                    color: AppColor.bgHeader,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(80),
                    )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: HeaderWorker(
                        title: 'Worker Profile',
                        subtitle: 'Details are matters',
                        iconLeft: 'assets/ic_back.png',
                        functionLeft: () => Navigator.pop(context),
                        iconRight: 'assets/ic_other.png',
                        functionRight: () => {}
                      ),
                    ),
                    DView.height(24),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 6
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            AppWrite.imageURL(widget.worker.image),
                            width: 136,
                            height: 136,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Obx(() {
                          String recruiterId = workerProfileController.recruiterId;
                          if (recruiterId == '') return DView.nothing();
                          if (recruiterId == 'Available') return DView.nothing();
                          if (recruiterId == userController.data.$id) {
                            return hiredByYou(); 
                          }
                          return hiredByOther();
                        })
                      ],
                    ),
                    DView.height(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.worker.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                          ),
                        ),
                        DView.width(4),
                        Image.asset(
                          'assets/ic_verified.png',
                          width: 20,
                          height: 20,
                        )
                      ],
                    ),
                    Obx(() {
                      String recruiterId = workerProfileController.recruiterId;
                      String txtAvailable = recruiterId == ' Available' ? ' • Available' : '';
                        return Text(
                          '${widget.worker.location} • ${widget.worker.experience}yrs$txtAvailable',
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        );
                      }
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Positioned hiredByYou() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, 6),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffBFA8FF),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4
            ),
            child: const Text(
              'HIRED BY YOU',
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

  Positioned hiredByOther() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Transform.translate(
          offset: const Offset(0, 6),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffFF7179),
              borderRadius: BorderRadius.circular(8)
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4
            ),
            child: const Text(
              'HIRED BY OTHER',
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