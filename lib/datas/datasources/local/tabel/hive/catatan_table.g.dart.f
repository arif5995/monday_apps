// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catatan_table.dart.f';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatatanTableAdapter extends TypeAdapter<CatatanTable> {
  @override
  final int typeId = 0;

  @override
  CatatanTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CatatanTable(
      id: fields[0] as int?,
      judul: fields[1] as String,
      deskripsi: fields[2] as String,
      status: fields[3] as bool,
      notif: fields[4] as String,
      createdate: fields[5] as String,
      updatedate: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CatatanTable obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.judul)
      ..writeByte(2)
      ..write(obj.deskripsi)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.notif)
      ..writeByte(5)
      ..write(obj.createdate)
      ..writeByte(6)
      ..write(obj.updatedate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatatanTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
