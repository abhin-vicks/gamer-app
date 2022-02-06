import 'package:flutter/material.dart';
import 'package:og_gamers/screens/home.dart';
import 'package:og_gamers/screens/login.dart';

import 'route_name.dart';

class CustomRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => HomeScreen(settings.arguments as String));
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
