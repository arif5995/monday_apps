import 'package:monday_app/commons/constant/name.dart';
import 'package:monday_app/commons/utils/database_utils.dart';
import 'package:monday_app/datas/datasources/local/configs/hive/base_hive_database.dart';
import 'package:monday_app/datas/datasources/local/tabel/hive/catatan_table.dart';
import 'package:monday_app/datas/models/catatan_model.dart';

class CatatanLocalDataSource
    extends BaseHiveDatabase<CatatanTable, CatatanModel> {
  CatatanLocalDataSource()
      : super(boxName: ConstantNameHelper.CATATAN_TABLE_NAME) {
    DatabaseUtil.registerAdapter<CatatanTable>(CatatanTableAdapter());
  }

  @override
  Future<List<CatatanModel>> getFormatedData() async {
    final List<CatatanTable> data = await getAll();
    return data.map(CatatanTable.toModel).toList();
  }

  Future<bool> insertOrUpdateItem(CatatanModel catatan) async {
    await put(catatan.id.toString(), CatatanTable.fromMap(catatan));
    final CatatanModel? berhasil = await get(catatan.id.toString());
    if (berhasil?.id == catatan.id) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> insertOrUpdateAll(List<CatatanModel> catatans) async {
    final Map<String, CatatanTable> todoMap = {
      for (var catatan in catatans)
        catatan.id.toString(): CatatanTable.fromMap(catatan)
    };
    await putAll(todoMap);
  }
}
