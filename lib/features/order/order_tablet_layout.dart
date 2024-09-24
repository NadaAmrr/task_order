import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/widgets/custom_drawer_widget.dart';
import 'package:task_order/features/order/widgets/make_order_section.dart';
import 'package:task_order/features/order/widgets/product_section_widget.dart';

class OrderTabletLayout extends StatelessWidget {
  const OrderTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawerWidget(
                      productTypeStyle:
            AppStyle.styleRegular14.copyWith(color: AppColors.blue),
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),

          /// products
          ProductSectionWidget(),

          /// makeOrder
          MakeOrderSection(width: MediaQuery.of(context).size.width * 0.3, height: MediaQuery.of(context).size.height)
        ],
      ),
    );
  }
}
