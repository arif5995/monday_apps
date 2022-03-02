import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/dasboard/controller/dashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
