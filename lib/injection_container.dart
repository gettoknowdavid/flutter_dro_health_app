import 'core/database/pharmacy_database.dart';
import 'features/cart/data/data_sources/cart_local_data_source.dart';
import 'features/cart/data/repositories/cart_repository_implementation.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/domain/use_cases/add_to_cart.dart';
import 'features/cart/domain/use_cases/get_cart_products.dart';
import 'features/cart/domain/use_cases/remove_from_cart.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/pharmacy/data/data_sources/pharmacy_local_data_source.dart';
import 'features/pharmacy/data/repositories/pharmacy_repository_implementation.dart';
import 'features/pharmacy/domain/repositories/pharmacy_repository.dart';
import 'features/pharmacy/domain/use_cases/get_products.dart';
import 'features/pharmacy/presentation/bloc/pharmacy_bloc.dart';
import 'features/pharmacy/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

final sl = GetIt.instance;
final StoreRef pharmacyStore = intMapStoreFactory.store('__pharmacy__');
final StoreRef cartStore = intMapStoreFactory.store('__cart_store__');

Future<void> init() async {
  // Features - PharmacyBloc
  // Bloc
  sl.registerFactory<PharmacyBloc>(
    () => PharmacyBloc(
      getProducts: sl(),
    ),
  );
  sl.registerFactory<SearchBloc>(
    () => SearchBloc(),
  );
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      addToCart: sl(),
      getCartProducts: sl(),
      removeFromCart: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton<GetProducts>(() => GetProducts(repository: sl()));
  sl.registerLazySingleton<GetCartProducts>(
      () => GetCartProducts(repository: sl()));
  sl.registerLazySingleton<AddToCart>(() => AddToCart(repository: sl()));
  sl.registerLazySingleton<RemoveFromCart>(
      () => RemoveFromCart(repository: sl()));

  // Repository
  sl.registerLazySingleton<PharmacyRepository>(
    () => PharmacyRepositoryImplementation(
      localDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImplementation(
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PharmacyLocalDataSource>(
    () => PharmacyLocalDataSourceImplementation(
      database: sl(),
      store: pharmacyStore,
    ),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImplementation(
      database: sl(),
      store: cartStore,
      pharmacyStore: pharmacyStore,
    ),
  );

  // External
  final pharmacyDatabase = await PharmacyDatabase.initialize();
  sl.registerLazySingleton<PharmacyDatabase>(() => pharmacyDatabase);
}
