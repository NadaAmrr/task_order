import 'package:flutter/material.dart';
import 'package:task_order/models/customer_model.dart';

class CustomerProvider with ChangeNotifier {
  final List<CustomerModel> customers = [];
   CustomerModel? customerModel;

  void addCustomer(CustomerModel customer) {
    customers.add(customer);
    notifyListeners();
  }

  void addCustomerOrder(CustomerModel customer) {
    customerModel = customer;
    notifyListeners();
  }

}