import 'package:dio/dio.dart';
import 'package:monday_app/app.dart';
import 'package:monday_app/bases/entity.dart';
import 'package:sqflite/sqflite.dart';

abstract class BaseDatabaseSQL<T extends Entity> {
  String get tableName;
  String get apiUrl;

  BaseDatabaseSQL() {
    registerRelation();
  }

  /// Abstract method that will be called to register relationships
  /// This method must be defined even with empty body
  void registerRelation();

  //default method that will convert raw response to data
  T toEntity(Map<String, dynamic>? map);

  //default method that will convert raw response to list data
  T toListEntity(Map<String, dynamic>? map);

  /// INFO : Basic Query Database
  /// Simple method to override the query
  Future<List<T>> query({
    String dbConnection = App.MONDAY_DB,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<dynamic>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    // get the database
    final Database? db = await App().connections[dbConnection]!.database;

    // query the result
    List<Map<String, dynamic>> rawResults = await db!.query(
      tableName,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );

    /// temporarily result
    List<T> results = [];

    /// change result to the correct object
    rawResults.forEach((Map<String, dynamic> res) {
      results.add(toEntity(res));
    });

    return results;
  }

  Future<List<dynamic>> batch(Function? actions(Batch batch),
      {String dbConnection = App.MONDAY_DB,
      bool? exclusive,
      bool? noResult,
      bool? continueOnError}) async {
    // get the database
    final Database? db = await App().connections[dbConnection]!.database;

    Batch dbBatch = db!.batch();

    actions(dbBatch);

    return await dbBatch.commit(
        exclusive: exclusive,
        noResult: noResult,
        continueOnError: continueOnError);
  }

  Future<int> update(
    Map<String, dynamic> entity, {
    String dbConnection = App.MONDAY_DB,
    String primaryKey = 'id',
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore,
  }) async {
    // get the database
    final Database? db = await App().connections[dbConnection]!.database;

    Map<String, dynamic>? entityMap = entity;

    // do the update
    return db!.update(
      tableName,
      entityMap,
      where: '$primaryKey = ?',
      whereArgs: [entityMap[primaryKey]],
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  /// Custom database insert helper for sqflite.
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqflite/DatabaseExecutor/insert.html
  Future<int> insert(Map<String, dynamic> entity,
      {String dbConnection = App.MONDAY_DB,
      String? nullColumnHack,
      ConflictAlgorithm? conflictAlgorithm}) async {
    final Database? db = await App().connections[dbConnection]!.database;
    return await db!.insert(tableName, entity);
  }

  /// Custom database delete helper for sqflite.
  /// see https://pub.dartlang.org/documentation/sqflite/latest/sqlite_api/DatabaseExecutor/delete.html
  Future<int> delete(String? id,
      {String primaryKey = 'id', String dbConnection = App.MONDAY_DB}) async {
    final Database? db = await App().connections[dbConnection]!.database;

    return await db!
        .delete(tableName, where: '$primaryKey = ?', whereArgs: [id]);
  }

  Future<int> deleteWhere(String where, List<String?>? whereArgs,
      {String dbConnection = App.MONDAY_DB}) async {
    final Database? db = await App().connections[dbConnection]!.database;

    return await db!.delete(tableName, where: where, whereArgs: whereArgs);
  }

  Future<T?> findOne(String? id, {String pkField = 'id'}) async {
    List<T> results = await query(where: '$pkField = ?', whereArgs: [id]);
    if (results.length > 0) return results.first;

    return null;
  }

  Future<int> deleteAllRecords({String dbConnection = App.MONDAY_DB}) async {
    final Database? db = (await App().connections[dbConnection]!.database);

    return await db!.rawDelete('DELETE FROM $tableName');
  }

  Future<List<T>> rawQuery(String query) async {
    String dbConnection = App.MONDAY_DB;
    final Database? db = await App().connections[dbConnection]!.database;

    List<Map<String, dynamic>> rawResults = await db!.rawQuery(query);

    /// temporarily result
    List<T> results = [];

    /// change result to the correct object
    rawResults.forEach((Map<String, dynamic> res) {
      results.add(toEntity(res));
    });

    return results;
  }

  Future<List<Map<String, dynamic>>> rawData(String query) async {
    String dbConnection = App.MONDAY_DB;
    final Database? db = await App().connections[dbConnection]!.database;
    return await db!.rawQuery(query);
  }

  /// INFO : Basic Query Api
  // Create data
  Future<T> post({Map<String, dynamic>? param, FormData? formData}) async {
    Response response = await App().dio.post(apiUrl, data: formData ?? param);
    return toEntity(response.data);
  }

  // Get all data
  Future<T> get({Map<String, dynamic>? param, String page = "1"}) async {
    Map<String, dynamic> tempParam = {"page": page};
    if (param != null) {
      tempParam.addAll(param);
    }
    Response response = await App().dio.get(apiUrl, queryParameters: tempParam);
    return toListEntity(response.data);
  }

  // Get data by Id
  Future<T> getById(Map<String, dynamic> param, int id) async {
    Response response =
        await App().dio.get("$apiUrl/$id", queryParameters: param);
    return toEntity(response.data);
  }

  // Edit data by id
  Future<T> put(int id,
      {Map<String, dynamic>? param, FormData? formData}) async {
    Response response =
        await App().dio.put("$apiUrl/$id", data: formData ?? param);
    return toEntity(response.data);
  }

  //Delete data with id
  Future<T> deleteApi(Map<String, dynamic> param, int id) async {
    Response response =
        await App().dio.delete("$apiUrl/$id", queryParameters: param);
    return toEntity(response.data);
  }
}
