import 'package:monday_app/domain/entities/catatan/catatan.dart';

class CatatanModel extends CatatanEntity {
  CatatanModel(
      {int? id,
      required String judul,
      required String deskripsi,
      bool status = false,
      required String notif,
      required String createdate,
      required String updatedate})
      : super(
            id: id,
            judul: judul,
            deskripsi: deskripsi,
            status: status,
            notif: notif,
            createdate: createdate,
            updatedate: updatedate);

  factory CatatanModel.fromMap(Map<String, dynamic> map) {
    return CatatanModel(
      id: map['id'],
      judul: map['judul'].toString(),
      deskripsi: map['deskripsi'].toString(),
      status: map['status'],
      notif: map['notif'].toString(),
      createdate: map['createdate'].toString(),
      updatedate: map['updatedate'].toString(),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "judul": judul,
      "deskripsi": deskripsi,
      "status": status,
      "notif": notif,
      "createdate": createdate,
      "updatedate": updatedate,
    };
  }
}
