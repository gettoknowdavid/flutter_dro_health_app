import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/usecase.dart';
import '../../domain/entities/cart_product.dart';
import '../../domain/use_cases/add_to_cart.dart';
import '../../domain/use_cases/get_cart_products.dart';
import '../../domain/use_cases/remove_from_cart.dart';
import '../../../pharmacy/domain/entities/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({
    @required this.addToCart,
    @required this.removeFromCart,
    @required this.getCartProducts,
  }) : super(CartEmpty());

  final AddToCart addToCart;
  final GetCartProducts getCartProducts;
  final RemoveFromCart removeFromCart;

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddToCartEvent) {
      await addToCart(Params(id: event.product.id));
      final result = await getCartProducts(NoParams());

      yield CartLoading();

      yield* _eitherFailureOrCartState(result);
    } else if (event is LoadCartEvent) {
      final result = await getCartProducts(NoParams());
      yield CartLoading();
      yield* _eitherFailureOrCartState(result);
    } else if (event is RemoveFromCartEvent) {
      await removeFromCart(Params(id: event.product.id));

      final result = await getCartProducts(NoParams());

      yield CartLoading();

      yield* _eitherFailureOrCartState(result);
    }
  }

  Stream<CartState> _eitherFailureOrCartState(
      Either<Failure, CartProduct> failureOrCart) async* {
    yield failureOrCart.fold(
      (failure) => CartError(message: _mapFailureToMessage(failure)),
      (cartProduct) {
        final products = cartProduct.products;
        final productsMap = cartProduct.productsMap;
        print(productsMap.values.map((e) => e).toList());

        return CartLoaded(products: products, productsMap: productsMap);
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case DatabaseFailure:
        return 'Database Error: Failed to load last air quality from store.';
      default:
        return 'Unexpected Error';
    }
  }
}
