import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/app/my_app.dart';
import 'package:task_order/features/order/provider/customer_provider.dart';
import 'package:task_order/features/order/provider/order_provider.dart';
import 'package:task_order/features/order/provider/productType_provider.dart';
import 'package:task_order/features/order/provider/products_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductTypeProvider()),
    ChangeNotifierProvider(create: (context) => ProductsProvider()),
    ChangeNotifierProvider(create: (context) => CustomerProvider()),
    ChangeNotifierProvider(create: (context) => OrdersProvider()),
  ], child: const MyApp()));
}
