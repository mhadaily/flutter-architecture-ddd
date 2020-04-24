import 'package:flutter_architecture_ddd/catalog/application/catalog_facade_service.dart';
import 'package:flutter_architecture_ddd/catalog/infrastructure/data_sources/product_local_data_provider.dart';
import 'package:flutter_architecture_ddd/catalog/infrastructure/data_sources/product_remote_data_provider.dart';
import 'package:flutter_architecture_ddd/catalog/infrastructure/repositories/product_repository.dart';
import 'package:flutter_architecture_ddd/catalog/presentation/catalog-detail/bloc/catalog_detail_bloc.dart';
import 'package:flutter_architecture_ddd/catalog/presentation/catalog-list/bloc/catalog_list_bloc.dart';
import 'package:flutter_architecture_ddd/common/platform/connectivity.dart';
import 'package:get_it/get_it.dart';


final serviceLocator = GetIt.instance;

// From Top To bottom
Future<void> init() async {
  // Catalog
  catalogDependencies();

  // sales
}

Future<void> catalogDependencies() async {
  // Presentation Layer - Blocs
  serviceLocator.registerFactory(
    () => CatalogListBloc(
      catalogService: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CatalogDetailBloc(
      catalogService: serviceLocator(),
    ),
  );

  // Application Layer - facades
  serviceLocator.registerLazySingleton(
    () => CatalogFacadeService(
      repository: serviceLocator(),
    ),
  );

  // Infrastructure Layer
  // repositories
  serviceLocator.registerLazySingleton(
    () => ProductRepository(
      connectivity: serviceLocator(),
      productLocalDataProvider: serviceLocator(),
      productRemoteDataProvider: serviceLocator(),
    ),
  );
  //data sources
  serviceLocator.registerLazySingleton(
    () => ProductLocalDataProvider(),
  );
  serviceLocator.registerLazySingleton(
    () => ProductRemoteDataProvider(),
  );

  // Common and core
  serviceLocator.registerLazySingleton(
    () => Connectivity(),
  );
}
