import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/failures.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}
