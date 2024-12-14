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
        itemSetting('assets/ic_edit.png', 'Edit Profile'),
        itemDivider(),
        itemSetting('assets/ic_invoice.png', 'Invoices'),
        itemDivider(),
        itemSetting('assets/ic_payment_setting.png', 'Payments'),
        itemDivider(),
        itemSetting('assets/ic_notification_setting.png', 'Notifications'),
        itemDivider(),
        itemSetting('assets/ic_rate_app.png', 'Rate App'),
        itemDivider(),
        itemSetting('assets/ic_sign_out.png', 'Sign Out', onTap: () {}),
      ],
    );
  }

  Widget itemDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: Color(0xffEAEAEA),
    );
  }

  Widget itemSetting(String icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      onTap: onTap,
      leading: ImageIcon(
        AssetImage(icon)
      ),
      title: Text(title),
      titleTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black
      ),
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