import 'package:dartz/dartz.dart';
import 'package:flutter_dro_health_app/core/constants/product_list.dart';
import 'package:flutter_dro_health_app/features/pharmacy/data/data_sources/pharmacy_local_data_source.dart';
import 'package:flutter_dro_health_app/features/pharmacy/data/repositories/pharmacy_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements PharmacyLocalDataSource {}

Future<void> main() async {
  MockLocalDataSource mockLocalDataSource;
  PharmacyRepositoryImplementation repository;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();

    repository = PharmacyRepositoryImplementation(
      localDataSource: mockLocalDataSource,
    );
  });

  group('getProducts', () {
    test(
      'should return local data when the call to local data source is successful',
      () async {
        when(mockLocalDataSource.getProducts()).thenAnswer(
          (_) async => ProductModels.values,
        );

        final result = await repository.getProducts();

        // verify(mockLocalDataSource.getProducts());

        expect(result, equals(Right(ProductModels.values)));
      },
    );

    test(
      'should store the data locally when the call to local data source is successful',
      () async {
        await repository.getProducts();

        verify(mockLocalDataSource.storeProducts(ProductModels.values));
      },
    );
  });
}
