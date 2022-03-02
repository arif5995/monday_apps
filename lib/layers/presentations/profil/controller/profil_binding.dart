import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/profil/controller/profilController.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(() => ProfilController());
  }
}
