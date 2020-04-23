import 'package:equatable/equatable.dart';

abstract class CatalogListEvent extends Equatable {
  const CatalogListEvent();
}

class FetchCatalogListEvent extends CatalogListEvent {
  
  @override
  String toString() {
    return 'FetchCatalogListEvent';
  }

  @override
  List<Object> get props => null;
}
