import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use_cases/usecase.dart';
import '../../domain/entities/product.dart';
import '../../domain/use_cases/get_products.dart';
import 'package:meta/meta.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  PharmacyBloc({@required this.getProducts}) : super(PharmacyEmpty());

  final GetProducts getProducts;

  @override
  Stream<PharmacyState> mapEventToState(
    PharmacyEvent event,
  ) async* {
    if (event is GetProductsEvent) {
      final failureOrPharmacy = await getProducts(NoParams());
      
      yield PharmacyLoading();

      yield* _eitherFailureOrPharmacyState(failureOrPharmacy);
    }
  }

  Stream<PharmacyState> _eitherFailureOrPharmacyState(
      Either<Failure, List<Product>> failureOrPharmacy) async* {
    yield failureOrPharmacy.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (products) => PharmacyLoaded(products: products),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case DatabaseFailure:
        return 'Database Error: Failed to load last air quality from store.';
      default:
        return 'Unexpected Error';
    }
  }
}
