import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/usecase.dart';
import '../repositories/cart_repository.dart';
import '../../../pharmacy/domain/entities/product.dart';

class RemoveFromCart implements UseCase<Product, Params> {
  RemoveFromCart({this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, Product>> call(params) async {
    return await repository.removeFromCart(params.id);
  }
}

