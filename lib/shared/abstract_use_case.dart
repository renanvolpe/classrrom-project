import 'package:classroom_project/shared/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input params);
}
