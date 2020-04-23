import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';
import 'package:meta/meta.dart';

class ProductModel extends Product {
  ProductModel({
    @required String id,
    @required String name,
    @required num price,
    @required String description,
  }) : super(id: id, name: name, price: price, description: description);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
    };
  }
}
