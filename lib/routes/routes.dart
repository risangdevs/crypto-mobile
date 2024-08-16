import 'package:crypto_mobile/screens/main/main_screen.dart';
import 'package:get/route_manager.dart';

class Routes {
  static String main = '/';
}

final getPages = [
  GetPage(
    name: Routes.main,
    page: () => const MainScreen(),
  ),
];
