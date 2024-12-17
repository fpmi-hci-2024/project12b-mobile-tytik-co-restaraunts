import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monkey_delivery/src/config/app_router.dart';
import 'package:monkey_delivery/src/locator/locator.dart';

void main() async {
  await configureCommonDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
    );
  }
}
