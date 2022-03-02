import 'package:monday_app/datas/models/catatan_model.dart';

abstract class CatatanLocalSource {
  Future<int> insertCatan(CatatanModel catatanModel);

  Future<List<CatatanModel>> getAllCatatan();
}
