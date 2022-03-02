import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/failures.dart';
import 'package:monday_app/datas/models/catatan_model.dart';
import 'package:monday_app/domain/repositories/catatan/catatan_repository.dart';

class InsertCatatanUseCase {
  final CatatanRepository catatanRepository;

  InsertCatatanUseCase(this.catatanRepository);

  Future<Either<Failure, int>> insertCatatan(CatatanModel catatan) async {
    return await catatanRepository.insertCatatan(catatan);
  }

  // Future<Either<Failure, int>> deleteCatan(String index) async {
  //   return await catatanRepository.deleteCatatanById(index);
  // }
  //
  // Future<Either<Failure, int>> deleteAllCatatan() async {
  //   return await catatanRepository.deleteAllCatatan();
  // }
  //
  // Future<Either<Failure, List<CatatanModel>>> getAllDataCatatan() async {
  //   return await catatanRepository.getAllDataCatatan();
  // }
  //
  // Future<Either<Failure, int>> updateCatatan(CatatanModel catatanModel) async {
  //   return await catatanRepository.updateCatatan(catatanModel);
  // }
}
