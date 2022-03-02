import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_library/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
