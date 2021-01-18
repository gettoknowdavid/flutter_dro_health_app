import 'dart:convert';

import 'package:flutter_dro_health_app/core/constants/product_list.dart';
import 'package:flutter_dro_health_app/core/database/pharmacy_database.dart';
import 'package:flutter_dro_health_app/features/pharmacy/data/data_sources/pharmacy_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/src/api/finder.dart' as finder;
import 'package:matcher/matcher.dart' as matcher;

class MockDatabase extends Mock implements Future<Database> {
  final Database db = GetIt.I.get();
  final StoreRef store = intMapStoreFactory.store('__pharmacy__');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PharmacyDatabase.initialize();

  PharmacyLocalDataSourceImplementation dataSource;
  MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    dataSource = PharmacyLocalDataSourceImplementation(
      database: mockDatabase.db,
      store: mockDatabase.store,
    );
  });

  group('getAllProducts', () {
    test(
      'should return all Products from SembastDatabase when they are present in the database',
      () async {
        final _finder = finder.Finder(sortOrders: [SortOrder('key', false)]);

        final snapshot = await mockDatabase.store.find(mockDatabase.db);

        when(await mockDatabase.store.find(mockDatabase.db, finder: _finder))
            .thenReturn(
          snapshot,
        );

        final result = await dataSource.getProducts();

        verify(mockDatabase.store.find(mockDatabase.db, finder: any));

        expect(result, matcher.equals(ProductModels.values));
      },
    );

    test(
      'should throw DatabaseException when there is no data in the store',
      () async {
        when(mockDatabase.store.find(mockDatabase.db)).thenReturn(null);

        final call = dataSource.getProducts;

        expect(() => call(), throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('storeProdcts', () {
    test(
      'should call SembastDatabase to store the Products',
      () async {
        await dataSource.storeProducts(ProductModels.values);

        final expectedJsonString = json.encode(
          ProductModels.values.map((e) => e.toJson()),
        );

        verify(mockDatabase.store.add(mockDatabase.db, expectedJsonString));
      },
    );
  });
}
