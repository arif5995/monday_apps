import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/authentification/controller/splashController.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.indigo[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Splash screen"),
                ],
              ),
            ),
          );
        });
  }
}
