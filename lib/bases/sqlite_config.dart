import 'package:monday_app/datas/datasources/local/migrations/sql/migration_db.dart';
import 'package:monday_app/datas/sqlite/db_connection.dart';

Map<String, DBConnection> connectionConfig(String typeDB) {
  return {"mondays": DBConnection(typeDB, migrationDb)};
}
