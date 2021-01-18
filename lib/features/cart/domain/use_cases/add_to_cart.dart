import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/usecase.dart';
import '../repositories/cart_repository.dart';
import '../../../pharmacy/domain/entities/product.dart';

class AddToCart implements UseCase<Product, Params> {
  AddToCart({this.repository});

  final CartRepository repository;

  @override
  Future<Either<Failure, Product>> call(Params params) async {
    return await repository.addToCart(params.id);
  }
}

