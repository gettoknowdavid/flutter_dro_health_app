import '../models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

abstract class PharmacyLocalDataSource {
  Future<List<ProductModel>> getProducts();

  Future<void> storeProducts(List<ProductModel> products);
}

class PharmacyLocalDataSourceImplementation implements PharmacyLocalDataSource {
  PharmacyLocalDataSourceImplementation({
    @required this.database,
    @required this.store,
  });

  Database database;
  StoreRef<int, Map<String, dynamic>> store;

  // final StoreRef store = intMapStoreFactory.store('__pharmacy__');

  @override
  Future<List<ProductModel>> getProducts() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final snapshot = await store.find(database, finder: finder);

    return snapshot
        .map((e) => ProductModel.fromJson(e.value))
        .toList(growable: false);
  }

  @override
  Future<void> storeProducts(List<ProductModel> products) async {
    await store.addAll(
      database,
      products.map((e) => e.toJson()).toList(),
    );
  }
}
