import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/widgets/custom_drawer_widget.dart';

class OrderDesktopLayout extends StatelessWidget {
  const OrderDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDrawerWidget(productTypeStyle: AppStyle.styleBold16, width: MediaQuery.of(context).size.width * 0.2, ),
    );
  }
}
