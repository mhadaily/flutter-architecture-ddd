import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable {
  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.description,
  });

  final String id;
  final String name;
  final num price;
  final String description;

  @override
  List<Object> get props => <dynamic>[id, name, price, description];
}
