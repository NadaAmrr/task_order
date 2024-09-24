import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/widgets/custom_drawer_widget.dart';

class OrderTabletLayout extends StatelessWidget {
  const OrderTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDrawerWidget(productTypeStyle: AppStyle.styleRegular14.copyWith(color: AppColors.blue), width: MediaQuery.of(context).size.width * 0.3,),
    );
  }
}
