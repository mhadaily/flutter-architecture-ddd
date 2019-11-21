import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';
import 'package:flutter_architecture_ddd/catalog/domain/logic/catalog_logic.dart';
import 'package:flutter_architecture_ddd/catalog/infrastructure/repositories/product_repository.dart';

class CatalogFacadeService with CatalogLogic {
  const CatalogFacadeService({
    this.repository,
  });

  final ProductRepository repository;

  Future<List<Product>> fetchProducts() async {
    return repository.fetchProducts();
  }

  Future<Product> getProduct(String id) async {
    return repository.getProduct(id);
  }
}
