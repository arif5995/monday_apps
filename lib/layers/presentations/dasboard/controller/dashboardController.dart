import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/home/controller/home_binding.dart';
import 'package:monday_app/layers/presentations/home/page/home_page.dart';
import 'package:monday_app/layers/presentations/inbox/controller/inbox_binding.dart';
import 'package:monday_app/layers/presentations/inbox/page/inbox_page.dart';
import 'package:monday_app/layers/presentations/laporan/controller/laporan_binding.dart';
import 'package:monday_app/layers/presentations/laporan/page/laporan_page.dart';
import 'package:monday_app/layers/presentations/profil/controller/profil_binding.dart';
import 'package:monday_app/layers/presentations/profil/page/profil_page.dart';

class DashboardController extends GetxController {
  // final ProfilController _profilController = Get.find();
  // var tabIndex = 0;
  // void changeTabIndex(int index) {
  //   tabIndex = index;
  //   // _profilController.resetButton();
  //   update();
  // }
  static DashboardController get to => Get.find();
  var currentIndex = 0.obs;

  final pages = <String>[
    HomePage.routeName,
    LaporanPage.routeName,
    'transaksi',
    InboxPage.routeName,
    ProfilPage.routeName
  ];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == HomePage.routeName)
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        binding: HomeBinding(),
      );

    if (settings.name == LaporanPage.routeName)
      return GetPageRoute(
        settings: settings,
        page: () => LaporanPage(),
        binding: LaporanBinding(),
      );

    if (settings.name == InboxPage.routeName)
      return GetPageRoute(
        settings: settings,
        page: () => InboxPage(),
        binding: InboxBinding(),
      );

    if (settings.name == ProfilPage.routeName)
      return GetPageRoute(
        settings: settings,
        page: () => ProfilPage(),
        binding: ProfilBinding(),
      );

    return null;
  }
}
