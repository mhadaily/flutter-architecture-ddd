import 'package:flutter_architecture_ddd/common/exceptions/server_exceptions.dart';
import 'package:flutter_architecture_ddd/common/platform/connectivity.dart';
import 'package:flutter_architecture_ddd/data_sources/product_local_data_provider.dart';
import 'package:flutter_architecture_ddd/data_sources/product_model.dart';
import 'package:flutter_architecture_ddd/data_sources/product_remote_data_provider.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  ProductRepository({
    @required this.connectivity,
    @required this.productLocalDataProvider,
    @required this.productRemoteDataProvider,
  });

  final Connectivity connectivity;
  final ProductLocalDataProvider productLocalDataProvider;
  final ProductRemoteDataProvider productRemoteDataProvider;

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
