
import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.buttonName, required this.onPressed,
  });
  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.main),
      ),
      child: Text(buttonName,
        style: AppStyle.styleBold16,
      ),
    );
  }
}