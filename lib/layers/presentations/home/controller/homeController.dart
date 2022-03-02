import 'dart:developer';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var search = false.obs;
  void changeiconsearch(bool? sch) {
    if (sch == true) {
      search.value = true;
    } else {
      search.value = false;
    }
    log(search.value.toString());
  }
}
