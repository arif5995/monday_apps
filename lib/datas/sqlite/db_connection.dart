import 'package:monday_app/bases/migration_base.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBConnection {
  final String dbName;
  final List<MigrationBase> migrations;

  //cache for database
  Database? _database;

  DBConnection(this.dbName, this.migrations);

  Future<Database?> get database async {
    if (_database == null) {
      // get the default database path
      String databasePath = await getDatabasesPath();

      // join the path with db name
      String path = join(databasePath, dbName);
      _database = await openDatabase(path, version: migrations.length,
          onUpgrade: (Database db, int oldVersion, int newVersion) async {
        print(oldVersion.toString() + ' to ' + newVersion.toString());
        for (int i = oldVersion; i < newVersion; i++) {
          print(i.toString() + ' masuk versi');
          await migrations[i].up(db);
        }
      });
    }
    return _database;
  }
}
