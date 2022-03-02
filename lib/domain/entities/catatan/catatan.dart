import 'package:equatable/equatable.dart';

class CatatanEntity extends Equatable {
  final int? id;
  final String judul;
  final String deskripsi;
  final bool status;
  final String notif;
  final String createdate;
  final String updatedate;

  CatatanEntity(
      {this.id,
      required this.judul,
      required this.deskripsi,
      required this.status,
      required this.notif,
      required this.createdate,
      required this.updatedate});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [judul, deskripsi, status, notif, createdate, updatedate];
}
