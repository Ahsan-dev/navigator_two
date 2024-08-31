import 'package:flutter/material.dart';

import 'my_route_paths.dart';

class MyRouteInfoParser extends RouteInformationParser<MyRoutePaths> {
  @override
  Future<MyRoutePaths> parseRouteInformation(RouteInformation routeInformation) async{
    print('Parse Route Info: ${routeInformation.uri}');
    if(routeInformation.uri.pathSegments.isEmpty){
      return MyRoutePaths.home();
    }
    if(routeInformation.uri.pathSegments.length==3
        && routeInformation.uri.pathSegments[0]=='products'
        && routeInformation.uri.pathSegments[1]=='product'){
      final id = routeInformation.uri.pathSegments[2];
      return MyRoutePaths.product(id);
    }else if (routeInformation.uri.pathSegments.length==1) {
      if(routeInformation.uri.pathSegments[0]=='about') {
        return MyRoutePaths.about();
      }
      if(routeInformation.uri.pathSegments[0]=='products') {
        return MyRoutePaths.products();
      }
    }
    return MyRoutePaths.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(MyRoutePaths configuration) {
    print('Restore Route Info: ${configuration.pathName}');
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if(configuration.id == null) {
      if(configuration.pathName == 'aboutPage') {
        return RouteInformation(uri: Uri.parse('/about'));
      }
      if(configuration.pathName == 'productsPage') {
        return RouteInformation(uri: Uri.parse('/products'));
      }
      return RouteInformation(uri: Uri.parse('/'));
    }
    return RouteInformation(uri: Uri.parse('/products/product/${configuration.id}'));
  }
}