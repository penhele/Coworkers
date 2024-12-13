import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/fragments/order_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderFragment extends StatefulWidget {
  const OrderFragment({super.key});

  @override
  State<OrderFragment> createState() => _OrderFragmentState();
}

class _OrderFragmentState extends State<OrderFragment> {
  final orderController = Get.put(OrderController());
  final userController = Get.put(UserController());

  @override
  void initState() {
    orderController.init(userController.data.$id!);
    super.initState();
  }

  @override
  void dispose() {
    orderController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    header(),
                    DView.height(20),
                    // menu
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Workers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  '13,492 transactions',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ),
          IconButton.filled(
            onPressed: () {},
            icon: const ImageIcon(AssetImage('assets/ic_search.png')),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              foregroundColor: WidgetStatePropertyAll(Colors.black)
            ),
          ),
          IconButton.filled(
            onPressed: () {},
            icon: const ImageIcon(AssetImage('assets/ic_filter.png')),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              foregroundColor: WidgetStatePropertyAll(Colors.black)
            ),
          ),
        ],
      ),
    );
  }
}