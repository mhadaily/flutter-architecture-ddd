import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';

abstract class ProductInterface {
  Future<List<Product>> fetchProducts();
  Future<Product> getProduct(String id);
}
