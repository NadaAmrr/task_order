import 'package:flutter/material.dart';
import 'package:task_order/models/customer_model.dart';

class CustomerProvider with ChangeNotifier {

  final List<CustomerModel> customers = [];
  // id
  int newCustomerId = 1;
  CustomerModel? customerModel;
  void makeId() {
    newCustomerId = customers.isNotEmpty
        ? int.parse(customers.last.id) + 1
        : 1;
    notifyListeners();
  }
  // Adding in customers list
  void addCustomer(CustomerModel customer) {
    customers.add(customer);
    notifyListeners();
  }
  // Add one customer
  void addCustomerOrder(CustomerModel customer) {
    customerModel = customer;
    notifyListeners();
  }
  // Edit customer
  void editCustomer(CustomerModel updatedCustomer) {
    int index = customers.indexWhere((customer) => customer.id == updatedCustomer.id);
    if (index != -1) {
      customers[index] = updatedCustomer;
      customerModel = updatedCustomer;
      notifyListeners();
    }
  }
  // Delete customer
  void deleteCustomer(String customerId) {
    customers.removeWhere((customer) => customer.id == customerId);
    customerModel = null;
    notifyListeners();
  }
}