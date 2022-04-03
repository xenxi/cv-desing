import 'package:cv_desing_website_flutter/presentation/core/app_router.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class FluroRouteGenerator {
  final FluroRouter _router;
  FluroRouteGenerator() : _router = FluroRouter() {
    _configureRoutes();
  }
  Route<dynamic>? generateRoute(RouteSettings settings) =>
      _router.generator(settings);

  void _configureRoutes() {
    AppRouter.routesMap.forEach((key, value) {
      _router.define(
        key,
        handler: Handler(
          handlerFunc: (context, parameters) => value(),
        ),
      );
    });
  }
}
