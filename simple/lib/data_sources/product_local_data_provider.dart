import 'package:flutter_architecture_ddd/data_sources/product_model.dart';

class ProductLocalDataProvider {
  Future<List<Product>> fetchProduct() {
    return null;
  }

  Future<Product> getProduct(String id) {
    return null;
  }

  Future<bool> cacheProduct(Product product) {
    //todo: cache model
    return null;
  }

  Future<bool> cacheProducts(List<Product> products) {
    //todo: cache model
    return null;
  }
}
