import 'package:equatable/equatable.dart';

abstract class CatalogListState extends Equatable {
  const CatalogListState();
}

class InitialCatalogListState extends CatalogListState {
  @override
  List<Object> get props => [];
}

class CatalogListLoadedState extends CatalogListState {
  CatalogListLoadedState(this.products);
  final dynamic products;

  @override
  List<Object> get props => <dynamic>[products];

  @override
  String toString() {
    return 'CatalogListLoadedState total: ${products.length}';
  }
}
