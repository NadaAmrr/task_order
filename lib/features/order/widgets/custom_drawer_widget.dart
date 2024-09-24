import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_assets.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/features/order/provider/productType_provider.dart';
import 'package:task_order/models/product_group_model.dart';
import 'package:task_order/models/product_type_model.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key, required this.productTypeStyle, required this.width});

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
              itemCount: provider.productTypes.length,
              itemBuilder: (context, index) {
                final productType = provider.productTypes[index];
                final int productTypeId = productType.id;
                final bool isProductType = productTypeId == provider.selectedProductType;

                /// List product groups filtered by product type ID
                final List<ProductGroupModel> filterProductGroups =
                provider.productGroups.where((productGroup) => productGroup.productTypesId == productTypeId).toList();

                return Column(
                  children: [
                    /// Product type item
                    productTypeItem(productTypeStyle, productType, isProductType, provider),

                    /// Show product groups if the product type is selected
                    if (isProductType)
                      Column(
                        children: filterProductGroups.map((productGroup) => productGroupWidget(productGroup, provider)).toList(),
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
  Widget productGroupWidget(ProductGroupModel productGroup,ProductTypeProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        title: Text(productGroup.name),
        onTap: () {
          provider.getProductGroupId(productGroup.id);
        },
      ),
    );
  }

  /// Product type item
  Widget productTypeItem(TextStyle productTypeStyle, ProductTypeModel productType, bool isProductType, ProductTypeProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: isProductType ? AppColors.main : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          productType.name,
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
          provider.changeProductType(productType.id);
        },
      ),
    );
  }
}
