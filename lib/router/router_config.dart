import 'package:flutter/material.dart';

import 'my_route_info_parser.dart';
import 'my_router_delegate.dart';

final myRouterConfig = RouterConfig(
    routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(uri: Uri.parse('/'))
    ),
    routeInformationParser: MyRouteInfoParser(),
    routerDelegate: MyRouterDelegate(),
    backButtonDispatcher: RootBackButtonDispatcher());
