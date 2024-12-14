import 'package:coworkers/config/app_color.dart';
import 'package:coworkers/controllers/user_controller.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({super.key});

  @override
  State<SettingFragment> createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: 172 + 120,
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
                margin: const EdgeInsets.only(bottom: 24),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    header(),
                    DView.height(20),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 6
                        ),
                        shape: BoxShape.circle,
                        color: const Color(0xffBFA8FF),
                      ),
                      alignment: Alignment.center,
                      child: Obx(() {
                        String initialName = userController.data.name == null ? '' : userController.data.name!.substring(0, 1);
                        return Text(
                          initialName,
                          style: const TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w700,
                            color: Colors.black
                          ),
                        );  
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DView.height(),
        Center(
          child: Obx(
            () => Text(
              userController.data.name ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Center(
          child: Text(
            'Recruiter Account',
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ),
        DView.height(),
      ],
    );
  }

  Column header() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        Text(
          'Protect your accout',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}