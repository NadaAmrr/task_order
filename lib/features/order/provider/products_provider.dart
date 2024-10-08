
import 'package:flutter/material.dart';
import 'package:task_order/core/utils/app_assets.dart';
import 'package:task_order/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(id: 1, name: 'Product A', productGroupId: 101, img: AppAssets.food1, price: 140,),
    ProductModel(id: 2, name: 'Product B', productGroupId: 201, img: AppAssets.food1,price: 240,),
    ProductModel(id: 3, name: 'Product C', productGroupId: 301, img: AppAssets.food1,price: 360,),
    ProductModel(id: 4, name: 'Product D', productGroupId: 101, img: AppAssets.food2,price: 440,),
    ProductModel(id: 5, name: 'Product E', productGroupId: 101, img: AppAssets.food3,price: 160,),
    ProductModel(id: 6, name: 'Product F', productGroupId: 101, img: AppAssets.food2,price: 220,),
    ProductModel(id: 7, name: 'Product G', productGroupId: 101, img: AppAssets.food5,price: 340,),
    ProductModel(id: 8, name: 'Product H', productGroupId: 101, img: AppAssets.food3,price: 430,),
    ProductModel(id: 10, name: 'Product I', productGroupId: 101, img: AppAssets.food1,price: 530,),
    ProductModel(id: 11, name: 'Product J', productGroupId: 501, img: AppAssets.food1,price: 600,),
    ProductModel(id: 12, name: 'Product K', productGroupId: 501, img: AppAssets.food2,price: 340,),
    ProductModel(id: 13, name: 'Product L', productGroupId: 501, img: AppAssets.food4,price: 100,),
    ProductModel(id: 14, name: 'Product M', productGroupId: 501, img: AppAssets.food1,price: 100,),
    ProductModel(id: 15, name: 'Product N', productGroupId: 501, img: AppAssets.food5,price: 100,),
    ProductModel(id: 16, name: 'Product O', productGroupId: 501, img: AppAssets.food1,price: 100,),
    ProductModel(id: 17, name: 'Product P', productGroupId: 101, img: AppAssets.food1,price: 100,),
    ProductModel(id: 18, name: 'Product Q', productGroupId: 101, img: AppAssets.food1,price: 100,),
    ProductModel(id: 19, name: 'Product R', productGroupId: 101, img: AppAssets.food1,price: 100,),
    ProductModel(id: 20, name: 'Product S', productGroupId: 101, img: AppAssets.food1,price: 100,),
    ProductModel(id: 21, name: 'Product T', productGroupId: 101, img: AppAssets.food1,price: 100,),
  ];

  List<ProductModel> getProductsByGroupId(int groupId) {
    return products.where((product) => product.productGroupId == groupId).toList();
  }
}