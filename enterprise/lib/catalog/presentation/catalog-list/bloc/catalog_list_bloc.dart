import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_ddd/catalog/application/catalog_facade_service.dart';
import 'package:flutter_architecture_ddd/catalog/domain/entities/product.dart';
import './bloc.dart';

class CatalogListBloc extends Bloc<CatalogListEvent, CatalogListState> {
  CatalogListBloc({this.catalogService}) : assert(catalogService != null);

  final CatalogFacadeService catalogService;

  @override
  CatalogListState get initialState => InitialCatalogListState();

  @override
  Stream<CatalogListState> mapEventToState(
    CatalogListEvent event,
  ) async* {
    if (event is FetchCatalogListEvent) {
      yield* _mapFetchCatalogEventToState();
    }
  }

  Stream<CatalogListLoadedState> _mapFetchCatalogEventToState() async* {
    final List<Product> products = await catalogService.fetchProducts();
    yield CatalogListLoadedState(products);
  }
}
