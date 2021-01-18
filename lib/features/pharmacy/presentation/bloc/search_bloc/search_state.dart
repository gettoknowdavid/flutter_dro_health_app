part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool isLoading;
  final List<Product> products;
  final bool hasError;

  const SearchState({this.isLoading, this.products, this.hasError});

  @override
  List<Object> get props => [isLoading, products, hasError];

  factory SearchState.initial() {
    return SearchState(products: [], isLoading: false, hasError: false);
  }

  factory SearchState.loading() {
    return SearchState(products: [], isLoading: true, hasError: false);
  }

  factory SearchState.success(List<Product> products) {
    return SearchState(products: products, isLoading: false, hasError: false);
  }

  factory SearchState.error() {
    return SearchState(products: [], isLoading: false, hasError: true);
  }
}
