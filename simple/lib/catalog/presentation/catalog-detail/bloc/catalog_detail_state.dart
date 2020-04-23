import 'package:equatable/equatable.dart';

abstract class CatalogDetailState extends Equatable {
  const CatalogDetailState();
}

class InitialCatalogDetailState extends CatalogDetailState {
  @override
  List<Object> get props => [];
}
