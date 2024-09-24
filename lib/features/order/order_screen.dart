import 'package:flutter/material.dart';
import 'package:task_order/core/widgets/adaptive_layout_widget.dart';
import 'package:task_order/features/order/order_desktop_layout.dart';
import 'package:task_order/features/order/order_mobile_layout.dart';
import 'package:task_order/features/order/order_tablet_layout.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
          mobileLayout: (context) => OrderMobileLayout(),
          tabletLayout: (context) => OrderTabletLayout(),
          desktopLayout: (context) => OrderDesktopLayout()),
    );
  }
}
