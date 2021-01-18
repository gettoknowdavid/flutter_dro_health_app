part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartEmpty extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Product> products;
  final Map<int, int> productsMap;

  CartLoaded({
   @required this.products,
   @required this.productsMap,
  });

  @override
  List<Object> get props => [products, productsMap];
}

class CartError extends CartState {
  CartError({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
