import 'package:monday_app/commons/repositories/catatan_service%20db.dart';
import 'package:monday_app/datas/datasources/local/catatan/catatan_local_source.dart';
import 'package:monday_app/datas/models/catatan_model.dart';

class CatatanLocalSourceImp implements CatatanLocalSource {
  final CatatanServiceDB catatanServiceDB;

  CatatanLocalSourceImp(this.catatanServiceDB);
  @override
  Future<List<CatatanModel>> getAllCatatan() async {
    return await catatanServiceDB.getCatatan();
  }

  @override
  Future<int> insertCatan(CatatanModel catatanModel) {
    // TODO: implement insertCatan
    throw UnimplementedError();
  }
}
