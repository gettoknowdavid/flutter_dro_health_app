import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/usecase.dart';
import '../entities/product.dart';
import '../repositories/pharmacy_repository.dart';
import 'package:meta/meta.dart';

class GetProducts implements UseCase<List<Product>, NoParams> {
  GetProducts({@required this.repository});

  final PharmacyRepository repository;

  @override
  Future<Either<Failure, List<Product>>> call(params) async {
    return await repository.getProducts();
  }
}