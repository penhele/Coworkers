import 'package:coworkers/controllers/fragments/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFragment extends StatefulWidget {
  const OrderFragment({super.key});

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  final orderController = Get.put(OrderController());

  @override
  void dispose() {
    orderController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}