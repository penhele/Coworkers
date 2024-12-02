import 'package:coworkers/config/app_color.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, this.onPressed, required this.child});
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: child,
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColor.btnSecondary,
        ),
        foregroundColor: WidgetStatePropertyAll(
          Colors.black
        )
      ),
    );
  }
}