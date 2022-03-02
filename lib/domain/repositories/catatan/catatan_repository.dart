import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/failures.dart';
import 'package:monday_app/datas/models/catatan_model.dart';

abstract class CatatanRepository {
  Future<Either<Failure, int>> insertCatatan(CatatanModel catatan);
  Future<Either<Failure, List<CatatanModel>>> getAllDataCatatan();
  Future<Either<Failure, int>> deleteCatatanById(String id);
  Future<Either<Failure, int>> deleteAllCatatan();
  Future<Either<Failure, int>> updateCatatan(CatatanModel catatan);
}
