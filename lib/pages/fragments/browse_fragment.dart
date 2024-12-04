import 'package:coworkers/controllers/fragments/browse_controller.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseFragment extends StatefulWidget {
  const BrowseFragment({super.key});

  @override
  State<BrowseFragment> createState() => _BrowseFragmentState();
}

class _BrowseFragmentState extends State<BrowseFragment> {
  final browseController = Get.put(BrowseController());
  final userController = Get.put(UserController());

  @override
  void dispose() {
    browseController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: 414,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                'assets/bg_discover_page.png',
                fit: BoxFit.cover, 
                width: MediaQuery.of(context).size.width,
                height: 414, 
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header()
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xffBFA8FF),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              )
            ),
            alignment: Alignment.center,
            child: Obx(() {
              return Text(
                userController.data.name?[0] ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              );
            }),
          ),
      
          DView.width(12),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Text(
                    'Hi, ${userController.data.name ?? ''}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  );
                }),
                const Text(
                  'Recuiter',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          ),
      
          IconButton.filled(
            onPressed: () {},
            icon: const Badge(
              smallSize: 10,
              backgroundColor: Colors.red,
              child: ImageIcon(AssetImage('assets/ic_notification.png')),
            ),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              foregroundColor: WidgetStatePropertyAll(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
