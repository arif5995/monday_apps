import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/authentification/controller/splashController.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
