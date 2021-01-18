import '../entities/cart_product.dart';

import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/usecase.dart';
import '../repositories/cart_repository.dart';

class GetCartProducts implements UseCase<CartProduct, NoParams> {
  GetCartProducts({this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, CartProduct>> call(NoParams params) async {
    return await repository.getCartProducts();
  }
}
