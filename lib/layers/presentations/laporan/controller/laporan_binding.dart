import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/laporan/controller/laporanController.dart';

class LaporanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanController>(() => LaporanController());
  }
}
