import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/failures.dart';

class EitherBas {
  checkReturn(Either<Failure, String> value) {
    value.fold((left) => null, (right) => null);
  }
}
