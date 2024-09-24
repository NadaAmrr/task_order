import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/widgets/custom_drawer_widget.dart';
import 'package:task_order/features/order/widgets/make_order_section.dart';
import 'package:task_order/features/order/widgets/product_section_widget.dart';

class OrderDesktopLayout extends StatelessWidget {
  const OrderDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// Drawer
          CustomDrawerWidget(
              productTypeStyle: AppStyle.styleBold16,
              width: MediaQuery.of(context).size.width * 0.2),

          /// products
           ProductSectionWidget(),

          /// makeOrder
          MakeOrderSection(width: MediaQuery.of(context).size.width * 0.3,  height: MediaQuery.of(context).size.height)
        ],
      ),
    );
  }
}


