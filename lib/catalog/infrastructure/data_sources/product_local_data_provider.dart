import 'package:flutter_architecture_ddd/catalog/infrastructure/models/product_model.dart';

class ProductLocalDataProvider {
  Future<List<ProductModel>> fetchProduct() {
    return null;
  }

  Future<ProductModel> getProduct(String id) {
    return null;
  }

  Future<bool> cacheProduct(ProductModel product) {
    //todo: cache model
    return null;
  }

  Future<bool> cacheProducts(List<ProductModel> products) {
    //todo: cache model
    return null;
  }
}
