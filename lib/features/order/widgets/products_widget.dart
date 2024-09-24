import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_order/core/utils/app_colors.dart';
import 'package:task_order/core/utils/app_style.dart';
import 'package:task_order/features/order/provider/products_provider.dart';

class ProductsWidget extends StatelessWidget {

  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductsProvider>(context).getProductsByGroupId(101);

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: AppColors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(
                //   child: FittedBox(
                //     fit: BoxFit.contain,
                //     child: Image.asset(product.img),
                //   ),
                // ),
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
          );
        },
      ),
    );
  }
}
