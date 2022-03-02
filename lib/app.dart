import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bases/sqlite_config.dart';
import 'commons/constant/name.dart';
import 'datas/sqlite/db_connection.dart';

class App {
  static const MONDAY_DB = 'mondays';
  static const MONDAY_DB_NAME = 'mondays.db';

  Map<String, DBConnection> connections = Map<String, DBConnection>();
  late Dio dio;
  late SharedPreferences sharedPreferences;
  String baseUrl = "";
  String dioContentType = "";
  int defaultTimeout = 0;

  Future<Null> init() async {
    int defaultTimeoutInMs = defaultTimeout * 1000;

    /// INFO : Init sharedPreferences
    sharedPreferences = await SharedPreferences.getInstance();

    connections = await connectionConfig(App.MONDAY_DB_NAME);

    //SETTING DIO
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: defaultTimeoutInMs,
        receiveTimeout: defaultTimeoutInMs,
        sendTimeout: defaultTimeoutInMs,
        contentType: dioContentType,
        responseType: ResponseType.json));
  }

  /// INFO : setting token header api
  void setDioHeader() {
    dio.options.headers = {
      'Token': sharedPreferences.get(ConstantNameHelper.TOKEN_KEY)
    };
  }

  /// INFO : setting dio interceptor
}
