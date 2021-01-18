import '../../../../core/constants/product_list.dart';
import '../data_sources/pharmacy_local_data_source.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/product.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/pharmacy_repository.dart';

class PharmacyRepositoryImplementation implements PharmacyRepository {
  PharmacyRepositoryImplementation({@required this.localDataSource});

  final PharmacyLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    final tProductModels = ProductModels.values;

    await localDataSource.storeProducts(tProductModels);

    return Right(tProductModels);
  }
}
