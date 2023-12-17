import 'package:flutter/material.dart';
import 'package:spatium_software_task/feature/graph/presentation/screen/graph_screen.dart';
import 'package:spatium_software_task/feature/numeric/presentation/screen/numeric_screen.dart';
import 'package:spatium_software_task/feature/splash/presentation/screen/splash_screen.dart';

class Routes{

  static const String initialRoutes = '/';

  static const String numericRoutes = 'NumericScreen';

  static const String graphRoutes = 'GraphScreen';

}

class AppRoutes{

  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.initialRoutes:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });
      case Routes.numericRoutes:
        return MaterialPageRoute(builder: (context) {
          return const NumericScreen();
        });
      case Routes.graphRoutes:
        return MaterialPageRoute(builder: (context) {
          return const GraphScreen();
        });
      default:
        return null;
    }
  }
}