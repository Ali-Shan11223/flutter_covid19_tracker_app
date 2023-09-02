import 'package:flutter/material.dart';
import 'package:flutter_covid19_tracker/view/splash_screen.dart';

import 'services/utilities/routes.dart';
import 'services/utilities/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      theme: ThemeData(
        fontFamily: 'Lato',
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
