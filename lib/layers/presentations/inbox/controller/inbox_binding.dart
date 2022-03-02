import 'package:get/get.dart';
import 'package:monday_app/commons/repositories/catatan_service%20db.dart';
import 'package:monday_app/datas/datasources/local/catatan/catatan_local_source_impl.dart';
import 'package:monday_app/datas/repository/catatan_repositories_imp.dart';
import 'package:monday_app/domain/usecases/fetch_catatan_usecase.dart';
import 'package:monday_app/domain/usecases/insert_catatan_usecase.dart';
import 'package:monday_app/layers/presentations/inbox/controller/InboxController.dart';

class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController(Get.find(), Get.find()));

    /// USE CASE
    Get.lazyPut(() => InsertCatatanUseCase(Get.find<CatatanRepositoriImp>()));
    Get.lazyPut(() => FetchCatatanUseCase(Get.find<CatatanRepositoriImp>()));

    /// REPOSITORY
    Get.lazyPut(() => CatatanRepositoriImp(Get.find<CatatanLocalSourceImp>()));

    /// LOCAL SOURCE
    Get.lazyPut(() => CatatanLocalSourceImp(Get.put(CatatanServiceDB())));
  }
}
