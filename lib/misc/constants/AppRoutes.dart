import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:statico/screens/auth/views/Splash.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => Splash()),
  ];
}
