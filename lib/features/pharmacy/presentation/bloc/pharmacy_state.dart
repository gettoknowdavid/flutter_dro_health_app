part of 'pharmacy_bloc.dart';

abstract class PharmacyState extends Equatable {
  const PharmacyState();

  @override
  List<Object> get props => [];
}

class PharmacyEmpty extends PharmacyState {}

class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  PharmacyLoaded({@required this.products});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}

class Error extends PharmacyState {
  Error({@required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}


