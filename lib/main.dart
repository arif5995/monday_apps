import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monday_app/layers/presentations/authentification/page/splash_page.dart';
import 'package:monday_app/layers/presentations/authentification/splash_binding.dart';
import 'package:monday_app/layers/presentations/dasboard/controller/dashboard_binding.dart';
import 'package:monday_app/layers/presentations/dasboard/page/dashboard.dart';

import 'layers/presentations/home/controller/home_binding.dart';
import 'layers/presentations/home/page/home_page.dart';
import 'layers/presentations/inbox/controller/inbox_binding.dart';
import 'layers/presentations/inbox/page/inbox_page.dart';

void main() async {
  // DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  // initServices();
  runApp(const MyApp());
}

// GetxService
initServices() {
  print('starting services ...');
  print('All services started...');
}

// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetCupertinoApp(
//       initialRoute: "/",
//       initialBinding: SplashBinding(),
//       home: Home(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          fontFamily: 'Rubik',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Colors.black,
            selectionHandleColor: Colors.black,
          )),
      // initialBinding: DashboardBinding(),
      getPages: [
        GetPage(
            name: SplashPage.routeName,
            page: () => SplashPage(),
            binding: SplashBinding()),
        GetPage(
            name: Dasboard.routeName,
            page: () => Dasboard(),
            binding: DashboardBinding()),
        GetPage(
            name: HomePage.routeName,
            page: () => HomePage(),
            binding: HomeBinding()),
        GetPage(
            name: InboxPage.routeName,
            page: () => InboxPage(),
            binding: InboxBinding())
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
