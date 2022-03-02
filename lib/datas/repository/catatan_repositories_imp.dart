import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/exceptions.dart';
import 'package:monday_app/commons/errors/failures.dart';
import 'package:monday_app/datas/datasources/local/catatan/catatan_local_source.dart';
import 'package:monday_app/datas/models/catatan_model.dart';
import 'package:monday_app/domain/repositories/catatan/catatan_repository.dart';

class CatatanRepositoriImp extends CatatanRepository {
  final CatatanLocalSource _catatanLocalSource;

  CatatanRepositoriImp(this._catatanLocalSource);

  @override
  Future<Either<Failure, int>> deleteAllCatatan() {
    // TODO: implement deleteAllCatatan
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> deleteCatatanById(String id) {
    // TODO: implement deleteCatatanById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CatatanModel>>> getAllDataCatatan() async {
    try {
      List<CatatanModel> _data = await _catatanLocalSource.getAllCatatan();
      return Right(_data);
    } on CacheException {
      return Left(LokalFailure(error: "false"));
    }
  }

  @override
  Future<Either<Failure, int>> insertCatatan(CatatanModel catatan) async {
    try {
      int _data = await _catatanLocalSource.insertCatan(catatan);
      return Right(_data);
    } on CacheException {
      return Left(LokalFailure(error: "false"));
    }
  }

  @override
  Future<Either<Failure, int>> updateCatatan(CatatanModel catatan) {
    // TODO: implement updateCatatan
    throw UnimplementedError();
  }
}
