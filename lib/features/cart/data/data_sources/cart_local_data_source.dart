import '../../domain/entities/cart_product.dart';
import '../../../pharmacy/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:sembast/sembast.dart';

abstract class CartLocalDataSource {
  Future<List<ProductModel>> getAllPharmacyProducts();

  Future<CartProduct> getCartProducts();

  Future<void> addToCart(int id);

  Future<void> removeFromCart(int id);
}

class CartLocalDataSourceImplementation implements CartLocalDataSource {
  CartLocalDataSourceImplementation({
    @required this.database,
    @required this.store,
    @required this.pharmacyStore,
  });

  Database database;
  StoreRef<int, Map<String, dynamic>> store;
  StoreRef<int, Map<String, dynamic>> pharmacyStore;

  @override
  Future<void> addToCart(int id) async {
    final products = await getAllPharmacyProducts();
    final product = products.firstWhere((e) => e.id == id);

    await store.add(database, product.toJson());
  }

  @override
  Future<CartProduct> getCartProducts() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final snapshot = await store.find(database, finder: finder);

    final products = snapshot
        .map((e) => ProductModel.fromJson(e.value))
        .toList(growable: false);

    final Map<int, int> productsMap = Map.fromIterable(
      products,
      key: (v) => v.id,
      value: (v) => products.where((e) => e.id == v.id).toList().length,
    );

    return CartProduct(products: products, productsMap: productsMap);
  }

  @override
  Future<void> removeFromCart(int id) async {
    final finder = Finder(filter: Filter.equals('id', id));

    final _record = await store.findFirst(database, finder: finder);
    final key = _record.key;

    await store.record(key).delete(database);
  }

  @override
  Future<List<ProductModel>> getAllPharmacyProducts() async {
    final finder = Finder(sortOrders: [SortOrder('key', false)]);
    final snapshot = await pharmacyStore.find(database, finder: finder);

    return snapshot
        .map((e) => ProductModel.fromJson(e.value))
        .toList(growable: false);
  }
}
