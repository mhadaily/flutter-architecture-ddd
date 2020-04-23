// TODO, add API
import 'package:flutter_architecture_ddd/catalog/application/catalog_facade_service.dart';
import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';
import 'package:flutter_architecture_ddd/injections.dart';

class CatalogApi {
  final CatalogFacadeService catalogFacade = serviceLocator<CatalogFacadeService>();

  Future<List<Product>> getProducts() async {
    return catalogFacade.fetchProducts();
  }

  Future<Product> getProduct(String id) async {
    return catalogFacade.getProduct(id);
  }

  String getOfficialProductManufacturer(String id) {
    return catalogFacade.getOfficialProductManufacturer(id);
  }
}
