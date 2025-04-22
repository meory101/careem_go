import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/navigation/fade_builder_route.dart';


///
/// created by eng nour othman ***
/// at 7/4/2025
///
abstract class RouteNamedScreens {
  static String init = splash;
  static const String splash = "/splash";

}

abstract class AppRouter {
  // ignore: body_might_complete_normally_nullable
  static Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case RouteNamedScreens.splash:
        return FadeBuilderRoute(
          page: Scaffold(),
        );
    }
  }

}
