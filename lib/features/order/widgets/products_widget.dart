import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/provider/order_provider.dart';
import 'package:task_order/features/order/provider/productType_provider.dart';
import 'package:task_order/features/order/provider/products_provider.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var productTypeProvider = Provider.of<ProductTypeProvider>(context);
    var productProvider = Provider.of<ProductsProvider>(context);
    var orderProvider = Provider.of<OrdersProvider>(context);
    final selectedProductTypeId = productTypeProvider.selectedProductTypeId;
    final products = selectedProductTypeId != null
        ? productProvider.getProductsByGroupId(selectedProductTypeId)
        : [];
    

    return selectedProductTypeId != null && products.isNotEmpty
        ? Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.75,
              ),
              itemCount: productProvider.products.length,
              itemBuilder: (context, index) {
                final product = productProvider.products[index];
                return InkWell(
                  onTap: () {
                    orderProvider.addToOrder(product); 
                  },
                  child: Card(
                    color: AppColors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(product.img),
                        Text(
                          product.name,
                          style: AppStyle.styleRegular12
                              ?.copyWith(color: AppColors.blue),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${product.price}',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : const SizedBox();
  }
}
