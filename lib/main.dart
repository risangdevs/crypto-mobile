import 'package:crypto_mobile/routes/routes.dart';
import 'package:crypto_mobile/themes/theme.dart';
import 'package:crypto_mobile/themes/theme_controller.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

void main() {
  EasyRefresh.defaultHeaderBuilder = () => const MaterialHeader();
  EasyRefresh.defaultFooterBuilder = () => const MaterialFooter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          title: 'Crypto',
          builder: FToastBuilder(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.main,
          getPages: getPages,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.theme,
        ));
  }
}
