import 'dart:developer';

import 'package:get/get.dart';

class ProfilController extends GetxController {
  var edit = true;
  var save = false;
  var cancel = false;
  void changeButton() {
    edit = false;
    save = true;
    cancel = true;
    update();
    log("message");
  }

  void resetButton() {
    edit = true;
    save = false;
    cancel = false;
    update();
    log("message");
  }

  @override
  void onClose() {
    super.onClose();
    print("PROFIL CLOSE");
  }
}
