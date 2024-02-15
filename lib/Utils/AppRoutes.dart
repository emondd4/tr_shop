
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Screens/Dashboard/DashboardScreen.dart';
import '../Screens/Splash/SplashScreen.dart';


class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
  List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => SplashScreen(),transition: Transition.native),
    GetPage(name: "/dashboardPage", page: () =>  DashboardScreen(),transition: Transition.native),
  ];


}