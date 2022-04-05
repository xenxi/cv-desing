import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/views/page_not_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FluroRouteGenerator {
  FluroRouteGenerator() : _router = FluroRouter() {
    _configureRoutes();
  }
  final FluroRouter _router;
  Route<dynamic>? generateRoute(RouteSettings settings) =>
      _router.generator(settings);

  void _configureRoutes() {
    AppRouter.routesMap.forEach((key, value) {
      _router.define(
        key,
        transitionType: kIsWeb ? TransitionType.fadeIn : TransitionType.fadeIn,
        handler: Handler(
          handlerFunc: (context, parameters) => value(),
        ),
      );
    });

    _router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) => const PageNotFoundView(),
    );
  }
}
