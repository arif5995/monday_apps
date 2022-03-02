import 'dart:developer';

import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/dasboard/page/dashboard.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log("Splash Screen");
    nextScreen();
    super.onInit();
  }

  nextScreen() async {
    Future.delayed(const Duration(seconds: 1),
        () => Get.offAndToNamed(Dasboard.routeName));
  }
}
