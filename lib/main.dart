import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/app/my_app.dart';
import 'package:task_order/features/order/provider/productType_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ProductTypeProvider()),
    // ChangeNotifierProvider(create: (context) => AnotherProvider()),
  ], child: const MyApp()));
}
