import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/list_worker_controller.dart';
import 'package:coworkers/widgets/header_worker.dart';
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: HeaderWorker(
                        title: widget.category,
                        subtitle: '13,492 workers',
                        iconLeft: 'assets/ic_back.png',
                        functionLeft: () => Navigator.pop(context),
                        iconRight: 'assets/ic_filter.png',
                        functionRight: () => {}
                      ),
                    ),
                    DView.nothing(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
