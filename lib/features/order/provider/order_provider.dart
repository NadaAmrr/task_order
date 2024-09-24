import 'package:flutter/material.dart';
import 'package:task_order/models/product_model.dart';

class OrdersProvider extends ChangeNotifier {
  List<ProductModel> orders = [];


  void addToOrder(ProductModel product) {
    orders.add(product);
    notifyListeners();
  }
}