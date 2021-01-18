import 'package:dartz/dartz.dart';
import '../entities/cart_product.dart';
import '../../../pharmacy/domain/entities/product.dart';
import '../../../../core/error/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, CartProduct>> getCartProducts();

  Future<Either<Failure, Product>> addToCart(int id);

  Future<Either<Failure, Product>> removeFromCart(int id);
}
