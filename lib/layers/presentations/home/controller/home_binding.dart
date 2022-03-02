import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/home/controller/homeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
