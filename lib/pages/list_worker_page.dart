import 'package:coworkers/controllers/list_worker_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListWorkerPage extends StatefulWidget {
  const ListWorkerPage({super.key, required this.category});
  final String category;

  @override
  State<ListWorkerPage> createState() => _ListWorkerPageState();
}

class _ListWorkerPageState extends State<ListWorkerPage> {
  final listWorkerController = Get.put(ListWorkerController());

  @override
  void initState() {
    listWorkerController.fetchAvailable(widget.category);
    super.initState();
  }

  @override
  void dispose() {
    listWorkerController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DView.appBarCenter(widget.category),
    );
  }
}