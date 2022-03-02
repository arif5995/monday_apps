import 'package:monday_app/bases/entity.dart';
import 'package:monday_app/bases/repository_base.dart';
import 'package:monday_app/datas/models/catatan_model.dart';

class CatatanServiceDB extends BaseDatabaseSQL {
  @override
  // TODO: implement apiUrl
  String get apiUrl => throw UnimplementedError();

  @override
  void registerRelation() {
    // TODO: implement registerRelation
  }

  @override
  // TODO: implement tableName
  String get tableName => 'catatan';

  @override
  Entity toEntity(Map<String, dynamic>? map) {
    // TODO: implement toEntity
    throw UnimplementedError();
  }

  @override
  Entity toListEntity(Map<String, dynamic>? map) {
    // TODO: implement toListEntity
    throw UnimplementedError();
  }

  Future<List<CatatanModel>> getCatatan() async {
    List _jasaData = await rawQuery('select * from catatan');
    return _jasaData.cast<CatatanModel>();
  }

  Future<int> insertCatatan(CatatanModel catatanModel) async {
    int _result = await insert(catatanModel.toMap());
    return await _result;
  }
}
