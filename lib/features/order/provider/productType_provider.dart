
import 'package:flutter/material.dart';

class ProductTypeProvider extends ChangeNotifier {
  int? selectedProductType;

  void changeProductType(int productTypeId) {
    if (selectedProductType == productTypeId) {
      selectedProductType = null;
    } else {
      selectedProductType = productTypeId;
    }
    notifyListeners();
  }
}