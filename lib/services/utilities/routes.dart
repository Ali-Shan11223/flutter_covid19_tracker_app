import 'package:flutter/material.dart';
import 'package:flutter_covid19_tracker/services/utilities/routes_names.dart';
import 'package:flutter_covid19_tracker/view/countries_list.dart';
import 'package:flutter_covid19_tracker/view/detail_screen.dart';
import 'package:flutter_covid19_tracker/view/splash_screen.dart';
import 'package:flutter_covid19_tracker/view/world_states.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.worldStates:
        return MaterialPageRoute(builder: (context) => const WorldStates());
      case RoutesName.countriesList:
        return MaterialPageRoute(builder: (context) => const CountriesList());
      case RoutesName.detailScreen:
        return MaterialPageRoute(
            builder: (context) => DetailScreen(
                title: settings.arguments as Map,
                flag: settings.arguments as Map,
                totalCases: settings.arguments as Map,
                deaths: settings.arguments as Map,
                recovered: settings.arguments as Map,
                critical: settings.arguments as Map,
                todayRecovered: settings.arguments as Map,
                tests: settings.arguments as Map));
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
