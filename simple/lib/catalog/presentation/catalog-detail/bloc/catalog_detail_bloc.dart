import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_ddd/catalog/logic/product_repository.dart';
import './bloc.dart';

class CatalogDetailBloc extends Bloc<CatalogDetailEvent, CatalogDetailState> {
  CatalogDetailBloc({
    this.catalogRepository, productRepository,
  }) : assert(catalogRepository != null);

  final ProductRepository catalogRepository;

  @override
  CatalogDetailState get initialState => InitialCatalogDetailState();

  @override
  Stream<CatalogDetailState> mapEventToState(
    CatalogDetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
