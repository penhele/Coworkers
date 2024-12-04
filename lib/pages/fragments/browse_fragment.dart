import 'package:coworkers/controllers/fragments/browse_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseFragment extends StatefulWidget {
  const BrowseFragment({super.key});

  @override
  State<BrowseFragment> createState() => _BrowseFragmentState();
}

class _BrowseFragmentState extends State<BrowseFragment> {
  final browseController = Get.put(BrowseController());

  @override
  void dispose() {
    browseController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}