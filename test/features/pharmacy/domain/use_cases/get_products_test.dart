import 'package:dartz/dartz.dart';
import 'package:flutter_dro_health_app/core/constants/product_list.dart';
import 'package:flutter_dro_health_app/core/use_cases/usecase.dart';
import 'package:flutter_dro_health_app/features/pharmacy/domain/repositories/pharmacy_repository.dart';
import 'package:flutter_dro_health_app/features/pharmacy/domain/use_cases/get_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPharmacyRepository extends Mock implements PharmacyRepository {}

void main() {
  GetProducts useCase;
  MockPharmacyRepository mockRepository;

  setUp(() {
    mockRepository = MockPharmacyRepository();
    useCase = GetProducts(repository: mockRepository);
  });
  final tProducts = Products.values;
  test(
    'should get list of products from the repository',
    () async {
      when(mockRepository.getProducts())
          .thenAnswer((_) async => Right(tProducts));

      final result = await useCase(NoParams());

      expect(result, Right(tProducts));

      verify(mockRepository.getProducts());

      verifyNoMoreInteractions(mockRepository);
    },
  );
}
