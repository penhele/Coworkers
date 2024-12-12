import 'package:coworkers/controllers/worker_profile_controller.dart';
import 'package:coworkers/models/worker_model.dart';
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
      appBar: DView.appBarCenter(widget.worker.name),
    );
  }
}