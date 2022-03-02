import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/commons/constant/images.dart';
import 'package:monday_app/commons/widgets/custombottom_bar.dart';
import 'package:monday_app/layers/presentations/dasboard/controller/dashboardController.dart';
import 'package:monday_app/layers/presentations/home/page/home_page.dart';
import 'package:monday_app/layers/presentations/transaksi/page/transaksi_page.dart';

class Dasboard extends GetView<DashboardController> {
  static const routeName = "/Dashboard";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Navigator(
              key: Get.nestedKey(1),
              initialRoute: HomePage.routeName,
              onGenerateRoute: controller.onGenerateRoute,
            ),
          ),
          // SafeArea(
          //   child: IndexedStack(
          //     index: controller.tabIndex,
          //     children: [
          //       HomePage(),
          //       LaporanPage(),
          //       Container(),
          //       InboxPage(),
          //       ProfilPage(),
          //     ],
          //   ),
          // ),
          bottomNavigationBar:
              Obx(() => _buildBottomBarSimple(context, controller)),
          // bottomSheet: TransactionModal(context: context),
        );
      },
    );
  }

  Widget _buildBottomBarSimple(
      BuildContext context, DashboardController controller) {
    return CustomBottomBar(
      selectedIndex: controller.currentIndex.value,
      containerHeight: 60,
      onItemSelected: controller.changePage,
      items: <BottomNavvBarItem>[
        BottomNavvBarItem(
            iconActive: ConstantImage.ACTHOME,
            iconDeactive: ConstantImage.DEAHOME,
            title: "Home"),
        BottomNavvBarItem(
            iconActive: ConstantImage.ACTCHART,
            iconDeactive: ConstantImage.DEACHART,
            title: "Chart"),
        BottomNavvBarItem(
            middle: true,
            iconWhite: ConstantImage.WHITEICON,
            iconActive: ConstantImage.ACTHOME,
            iconDeactive: ConstantImage.DEAHOME,
            title: "Transaction",
            tap: () {
              print("TRANSAKSION");
              TransactionModal(context: context, items: <ItemBottomSheet>[
                ItemBottomSheet(
                    image: ConstantImage.HUTANG_SMALL,
                    judul: "Deposit",
                    onClick: () {}),
                ItemBottomSheet(
                    image: ConstantImage.HUTANG_SMALL,
                    judul: "Deposit",
                    onClick: () {}),
                ItemBottomSheet(
                    image: ConstantImage.HUTANG_SMALL,
                    judul: "Deposit",
                    onClick: () {}),
                ItemBottomSheet(
                    image: ConstantImage.HUTANG_SMALL,
                    judul: "Deposit",
                    onClick: () {})
              ]);
            }),
        BottomNavvBarItem(
            iconActive: ConstantImage.ACTINBOX,
            iconDeactive: ConstantImage.DEAINBOX,
            title: "Catatan"),
        BottomNavvBarItem(
            iconActive: ConstantImage.ACTME,
            iconDeactive: ConstantImage.DEAME,
            title: "Aku"),
      ],
    );
  }
}
