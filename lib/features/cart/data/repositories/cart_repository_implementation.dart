import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../pharmacy/domain/entities/product.dart';
import '../../domain/entities/cart_product.dart';
import '../../domain/repositories/cart_repository.dart';
import '../data_sources/cart_local_data_source.dart';

class CartRepositoryImplementation implements CartRepository {
  CartRepositoryImplementation({@required this.localDataSource});

  final CartLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Product>> addToCart(int id) async {
    await localDataSource.addToCart(id);
    final products = await localDataSource.getAllPharmacyProducts();

    final product = products.firstWhere((e) => e.id == id);

    return Right(product);
  }

  @override
  Future<Either<Failure, CartProduct>> getCartProducts() async {
    final result = await localDataSource.getCartProducts();

    return Right(result);
  }

  @override
  Future<Either<Failure, Product>> removeFromCart(int id) async {
    await localDataSource.removeFromCart(id);

    final products = await localDataSource.getAllPharmacyProducts();

    final product = products.firstWhere((e) => e.id == id);
    return Right(product);
  }
}
