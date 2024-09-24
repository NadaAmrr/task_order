
import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_strings.dart';
import 'package:task_order/features/order/order_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      home: OrderScreen(),
    );
  }
}