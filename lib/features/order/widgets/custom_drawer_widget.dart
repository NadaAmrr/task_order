import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_assets.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/features/order/provider/productType_provider.dart';


class CustomDrawerWidget extends StatelessWidget {
  /// Product types
  final List<Map<String, dynamic>> productTypes = [
    {'id': 1, 'name': 'Food Products'},
    {'id': 2, 'name': 'Beverages'},
    {'id': 3, 'name': 'Product type3'},
    {'id': 4, 'name': 'Product type4'},
    {'id': 5, 'name': 'Product type5'},
  ];

  /// Product groups
  final List<Map<String, dynamic>> productGroups = [
    {'id': 101, 'name': 'Main Courses', 'productTypesId': 1},
    {'id': 102, 'name': 'Appetizers', 'productTypesId': 1},
    {'id': 103, 'name': 'Desserts', 'productTypesId': 1},
    {'id': 201, 'name': 'Juices', 'productTypesId': 2},
    {'id': 301, 'name': 'product groups 1', 'productTypesId': 3},
    {'id': 401, 'name': 'product groups 1', 'productTypesId': 4},
    {'id': 501, 'name': 'product groups 1', 'productTypesId': 5},
    {'id': 502, 'name': 'product groups 2', 'productTypesId': 5},
    {'id': 503, 'name': 'product groups 3', 'productTypesId': 5},
    {'id': 504, 'name': 'product groups 4', 'productTypesId': 5},
    {'id': 505, 'name': 'product groups 5', 'productTypesId': 5},
    {'id': 506, 'name': 'product groups 6', 'productTypesId': 5},
  ];

  // int? selectedProductType;

  CustomDrawerWidget({super.key, required this.productTypeStyle,required this.width});
  final TextStyle productTypeStyle;
  final double width;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductTypeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(8),
      width: width,
      color: AppColors.grey,
      child: Column(
        children: [
          /// Logo
          Image.asset(AppAssets.food4),
          /// List of product types with product groups
          Expanded(
            child: ListView.builder(
              itemCount: productTypes.length,
              itemBuilder: (context, index) {
                final productType = productTypes[index];
                final int productTypeId = productType['id'];
                final bool isProductType = productTypeId == provider.selectedProductType;

                /// List product groups filtered by product type ID
                final List<Map<String, dynamic>> filterProductGroups =
                    productGroups
                        .where((productGroups) =>
                            productGroups['productTypesId'] == productTypeId)
                        .toList();

                return Column(

                  children: [
                    /// product type item
                    productTypeItem(productTypeStyle, productType, isProductType, productTypeId, provider),

                    /// is product type => show product groups of it
                    if (isProductType)
                      Column(
                        children: filterProductGroups.map((productGroup) {
                          return productGroupWidget(productGroup);
                        }).toList(),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Product group item
  Widget productGroupWidget(Map<String, dynamic> productGroup) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        title: Text(productGroup['name']),
        onTap: () {},
      ),
    );
  }
/// Product type item
  Widget productTypeItem(TextStyle productTypeStyle,
      Map<String, dynamic> productType, bool isProductType, int productTypeId, ProductTypeProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: isProductType ? AppColors.main : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          productType['name'],
          style: productTypeStyle,
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: isProductType ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            color: AppColors.blue,
            isProductType ? Icons.arrow_drop_up : Icons.arrow_drop_down,
          ),
        ),
        onTap: () {
          provider.changeProductType(productTypeId);
        },
      ),
    );
  }
}
