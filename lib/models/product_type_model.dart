class ProductTypeModel {
  final int id;
  final String name;

  ProductTypeModel({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  ProductTypeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
