import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class PharmacyRepository {
  Future<Either<Failure, List<Product>>> getProducts();
}
