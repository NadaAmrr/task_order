class ProductGroupModel {
  final int id;
  final String name;
  final int productTypesId;

  ProductGroupModel({
    required this.id,
    required this.name,
    required this.productTypesId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'productTypesId': productTypesId,
    };
  }

  ProductGroupModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        productTypesId = json['productTypesId'];
}

