import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_ddd/catalog/application/catalog_facade_service.dart';
import './bloc.dart';

class CatalogDetailBloc extends Bloc<CatalogDetailEvent, CatalogDetailState> {
  CatalogDetailBloc({this.catalogService}) : assert(catalogService != null);

  final CatalogFacadeService catalogService;

  @override
  CatalogDetailState get initialState => InitialCatalogDetailState();

  @override
  Stream<CatalogDetailState> mapEventToState(
    CatalogDetailEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
