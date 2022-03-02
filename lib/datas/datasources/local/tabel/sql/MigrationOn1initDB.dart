import 'package:monday_app/bases/migration_base.dart';
import 'package:sqflite_common/sqlite_api.dart';

class Migration0n1initDB extends MigrationBase {
  @override
  Future<void> up(Database db) async {
    await db.execute("CREATE TABLE catatan ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "judul TEXT, "
        "deskripsi TEXT, "
        "status BOOLEAN, "
        "notif TEXT, "
        "createdate TEXT, "
        "updatedate TEXT, "
        ")");
  }
}
