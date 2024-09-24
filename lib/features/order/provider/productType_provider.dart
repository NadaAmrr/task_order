
import 'package:flutter/material.dart';
import 'package:task_order/models/product_group_model.dart';
import 'package:task_order/models/product_model.dart';
import 'package:task_order/models/product_type_model.dart';

class ProductTypeProvider extends ChangeNotifier {
  /// selected product type id
  int? selectedProductTypeId;

 /// product types
  final List<ProductTypeModel> productTypes = [
    ProductTypeModel(id: 1, name: 'Food Products'),
    ProductTypeModel(id: 2, name: 'Beverages'),
    ProductTypeModel(id: 3, name: 'Product type3'),
    ProductTypeModel(id: 4, name: 'Product type4'),
    ProductTypeModel(id: 5, name: 'Product type5'),
  ];

  /// product groups
  final List<ProductGroupModel> productGroups = [
    ProductGroupModel(id: 101, name: 'Main Courses', productTypesId: 1),
    ProductGroupModel(id: 102, name: 'Appetizers', productTypesId: 1),
    ProductGroupModel(id: 103, name: 'Desserts', productTypesId: 1),
    ProductGroupModel(id: 201, name: 'Juices', productTypesId: 2),
    ProductGroupModel(id: 301, name: 'product groups 1', productTypesId: 3),
    ProductGroupModel(id: 401, name: 'product groups 1', productTypesId: 4),
    ProductGroupModel(id: 501, name: 'product groups 1', productTypesId: 5),
    ProductGroupModel(id: 502, name: 'product groups 2', productTypesId: 5),
    ProductGroupModel(id: 503, name: 'product groups 3', productTypesId: 5),
    ProductGroupModel(id: 504, name: 'product groups 4', productTypesId: 5),
    ProductGroupModel(id: 505, name: 'product groups 5', productTypesId: 5),
    ProductGroupModel(id: 506, name: 'product groups 6', productTypesId: 5),
  ];
  /// selected product type
  int? selectedProductType;

  void changeProductType(int productTypeId) {
    if (selectedProductType == productTypeId) {
      selectedProductType = null;
    } else {
      selectedProductType = productTypeId;
    }
    notifyListeners();
  }

  /// get product group id
 void getProductGroupId(id) {
    selectedProductTypeId = id;
   notifyListeners();
 }
}