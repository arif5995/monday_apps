import 'package:dartz/dartz.dart';
import 'package:monday_app/commons/errors/failures.dart';
import 'package:monday_app/domain/entities/catatan/catatan.dart';
import 'package:monday_app/domain/repositories/catatan/catatan_repository.dart';

class FetchCatatanUseCase {
  final CatatanRepository catatanRepository;

  FetchCatatanUseCase(this.catatanRepository);

  Future<Either<Failure, List<CatatanEntity>>> getAllDataCatatan() async {
    return await catatanRepository.getAllDataCatatan();
  }
}
