import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/constants/product_list.dart';
import '../../../domain/entities/product.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    yield SearchState.loading();

    try {
      List<Product> products = await _getSearchResults(event.query);
      yield SearchState.success(products);
    } catch (_) {
      yield SearchState.error();
    }
  }

  Future<List<Product>> _getSearchResults(String query) async {
    return Products.values
        .where((e) =>
            e.name.toLowerCase().contains(query) ||
            e.name.toUpperCase().contains(query))
        .toList();
  }
}
