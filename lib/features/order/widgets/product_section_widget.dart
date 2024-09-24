import 'package:flutter/material.dart';
import 'package:task_order/features/order/widgets/products_widget.dart';
import 'package:task_order/features/order/widgets/search_widget.dart';

class ProductSectionWidget extends StatelessWidget {
  const ProductSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          SearchWidget(),
          ProductsWidget(),
        ],
      ),
    );
  }
}
