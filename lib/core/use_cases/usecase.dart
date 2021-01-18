import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => throw UnimplementedError();
}

class Params extends Equatable {
  Params({@required this.id});

  final int id;


  @override
  List<Object> get props => [id];
}