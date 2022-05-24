import 'package:cv_desing_website_flutter/application/auth/auth_bloc.dart';
import 'package:cv_desing_website_flutter/application/navigation/navigation_bloc.dart';
import 'package:cv_desing_website_flutter/presentation/core/custom_theme.dart';
import 'package:cv_desing_website_flutter/presentation/core/dependency_injections/ioc.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/app_router.dart';
import 'package:cv_desing_website_flutter/presentation/core/routes/fluro_route_generator.dart';
import 'package:cv_desing_website_flutter/presentation/layouts/public_layout.dart';
import 'package:cv_desing_website_flutter/presentation/shared/values/location.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CvDesingApp extends StatelessWidget {
  const CvDesingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<NavigationBloc>(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
        scrollBehavior: _MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: Location.appTitle,
        initialRoute: AppRouter.initial,
        onGenerateRoute: FluroRouteGenerator().generateRoute,
        builder: (context, child) => PublicLayout(child: child!),
        theme: CustomTheme.lightTheme,
      ),
    );
  }
}

class _MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
