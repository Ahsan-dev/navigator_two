import 'package:flutter/material.dart';
import 'package:navigator_two/router/my_route_info_parser.dart';
import 'package:navigator_two/router/my_route_paths.dart';
import 'package:navigator_two/router/my_router_delegate.dart';
import 'package:navigator_two/router/router_config.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // routerConfig: myRouterConfig,
        routeInformationParser: MyRouteInfoParser(),
        routerDelegate: MyRouterDelegate(),
        backButtonDispatcher: RootBackButtonDispatcher()
    );
  }
}
