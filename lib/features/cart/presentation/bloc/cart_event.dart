part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;

  AddToCartEvent(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() {
    return 'AddToCart { $product }';
  }
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;

  RemoveFromCartEvent(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() {
    return 'RemoveFromCart { $product }';
  }
}
