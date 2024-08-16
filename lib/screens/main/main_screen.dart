import 'package:crypto_mobile/screens/main/main_screen_controller.dart';
import 'package:crypto_mobile/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    MainScreenController controller = Get.put(
      MainScreenController(),
      tag: "main_screen",
    );
    final ThemeController themeController = Get.find();

    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.getTitle()),
            actions: controller.getTitle().toString() == controller.componentList[3].title
                ? [
                    Obx(() {
                      return Switch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) {
                          themeController.toggleTheme();
                        },
                      );
                    }),
                  ]
                : null,
          ),
          body: controller.getComponent(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: controller.setCurrentIndex,
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home_filled),
                label: controller.componentList[0].title,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.add_chart),
                activeIcon: const Icon(Icons.add_chart_outlined),
                label: controller.componentList[1].title,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.currency_exchange),
                activeIcon: const Icon(Icons.currency_exchange_outlined),
                label: controller.componentList[2].title,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings_applications),
                activeIcon: const Icon(Icons.settings_applications_outlined),
                label: controller.componentList[3].title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
