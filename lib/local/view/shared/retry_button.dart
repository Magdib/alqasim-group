import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj/local/view/widgets/buttons/button_with_icon.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({
    super.key,
    required this.onTap,
    this.width,
  });

  final VoidCallback onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return ButtonWithIcon(
        title: "اعد المحاولة".tr,
        icon: Icons.sync,
        minWidth: width,
        reverse: true,
        onPressed: onTap);
  }
}
