import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_ddd/catalog/logic/product_repository.dart';
import 'package:flutter_architecture_ddd/data_sources/product_model.dart';
import './bloc.dart';

class CatalogListBloc extends Bloc<CatalogListEvent, CatalogListState> {
  CatalogListBloc({this.productRepository}) : assert(productRepository != null);

  final ProductRepository productRepository;

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
    final List<Product> products = await productRepository.fetchProducts();
    yield CatalogListLoadedState(products);
  }
}
