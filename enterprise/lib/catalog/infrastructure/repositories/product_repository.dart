import 'package:flutter_architecture_ddd/catalog/infrastructure/data_sources/product_local_data_provider.dart';
import 'package:flutter_architecture_ddd/catalog/infrastructure/data_sources/product_remote_data_provider.dart';
import 'package:flutter_architecture_ddd/common/exceptions/server_exceptions.dart';
import 'package:flutter_architecture_ddd/common/platform/connectivity.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';
import 'package:flutter_architecture_ddd/catalog/domain/interfaces/product_interface.dart';

class ProductRepository implements ProductInterface {
  ProductRepository({
    @required this.connectivity,
    @required this.productLocalDataProvider,
    @required this.productRemoteDataProvider,
  });

  final Connectivity connectivity;
  final ProductLocalDataProvider productLocalDataProvider;
  final ProductRemoteDataProvider productRemoteDataProvider;

  @override
  Future<List<Product>> fetchProducts() async {
    if (connectivity.isConnected) {
      try {
        final List<Product> products =
            await productRemoteDataProvider.fetchProduct();
        productLocalDataProvider.cacheProducts(products);
        return products;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      return productLocalDataProvider.fetchProduct();
    }
  }

  @override
  Future<Product> getProduct(String id) async {
    if (connectivity.isConnected) {
      try {
        final Product product = await productRemoteDataProvider.getProduct(id);
        // cache product
        productLocalDataProvider.cacheProduct(product);
        return product;
      } catch (e) {
        print(e);
        return ServerException()();
      }
    } else {
      return productLocalDataProvider.getProduct(id);
    }
  }
}
