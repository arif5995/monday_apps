import 'package:hive/hive.dart';
import 'package:monday_app/commons/constant/name.dart';
import 'package:monday_app/datas/models/catatan_model.dart';

part 'catatan_table.g.dart';

@HiveType(typeId: ConstantNameHelper.CATATAN_TABLE_ID)
class CatatanTable extends CatatanModel {
  @override
  @HiveField(0)
  int? id;

  @override
  @HiveField(1)
  String judul;

  @override
  @HiveField(2)
  String deskripsi;

  @override
  @HiveField(3)
  bool status;

  @override
  @HiveField(4)
  String notif;

  @override
  @HiveField(5)
  String createdate;

  @override
  @HiveField(6)
  String updatedate;

  CatatanTable(
      {this.id,
      required this.judul,
      required this.deskripsi,
      required this.status,
      required this.notif,
      required this.createdate,
      required this.updatedate})
      : super(
            judul: judul,
            deskripsi: deskripsi,
            status: status,
            notif: notif,
            createdate: createdate,
            updatedate: updatedate);

  static CatatanModel toModel(CatatanTable table) => CatatanModel(
      id: table.id,
      judul: table.judul,
      deskripsi: table.deskripsi,
      notif: table.notif,
      createdate: table.createdate,
      updatedate: table.updatedate);

  factory CatatanTable.fromMap(CatatanModel catatanModel) {
    return CatatanTable(
      id: catatanModel.id,
      judul: catatanModel.judul,
      deskripsi: catatanModel.deskripsi,
      status: catatanModel.status,
      notif: catatanModel.notif,
      createdate: catatanModel.createdate,
      updatedate: catatanModel.updatedate,
    );
  }
}
