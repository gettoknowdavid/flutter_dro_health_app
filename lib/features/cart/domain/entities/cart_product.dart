import 'package:equatable/equatable.dart';
import '../../../pharmacy/data/models/product_model.dart';
import 'package:meta/meta.dart';

class CartProduct extends Equatable {
  final List<ProductModel> products;
  final Map<int, int> productsMap;

  CartProduct({
    @required this.products,
    @required this.productsMap,
  });

  @override
  List<Object> get props => [products, productsMap];
}
