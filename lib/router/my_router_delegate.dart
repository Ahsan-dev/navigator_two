import 'package:flutter/material.dart';
import 'package:navigator_two/pages/about_page.dart';
import 'package:navigator_two/pages/home_page.dart';
import 'package:navigator_two/pages/products_page.dart';
import 'package:navigator_two/router/my_route_paths.dart';

import '../pages/product_page.dart';
import '../pages/unknown_page.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePaths>
with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePaths> {
  String? selectedItemId;
  String? pathName;
  bool show404 = false;
  @override
  MyRoutePaths? get currentConfiguration  {
    print("Current configuration: {pathName: ${pathName}}");
    if (show404) {
      return MyRoutePaths.unknown();
    }
    if(selectedItemId == null) {
      if(pathName == 'aboutPage') {
        return MyRoutePaths.about();
      }else if(pathName == 'productsPage') {
        return MyRoutePaths.products();
      }
      return MyRoutePaths.home();
    }else {
      return MyRoutePaths.product(selectedItemId);
    }
  }


  @override
  Future<void> setNewRoutePath(MyRoutePaths configuration) async{
    print('Set New Route Path: ${configuration.pathName}');
    if (configuration.isUnknown) {
      show404 = true;
      notifyListeners();
      return;
    }
    if(configuration.id == null) {
      selectedItemId = null;
      pathName = configuration.pathName;
    } else {
      selectedItemId = configuration.id;
      pathName = configuration.pathName;
    }
    show404 = false;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    print("Current stack => ${navigatorKey?.currentState?.context.size}");
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(onTapped: _handleOnTap,)
        ),
        if (show404) MaterialPage(key: ValueKey('Unknown Page'), child: UnknownPage())
        else if(selectedItemId != null)
          MaterialPage(
            key: ValueKey('ProductPage'),
            child: ProductPage(pid: selectedItemId,)
          )
        else
          if(pathName == 'aboutPage')
            MaterialPage(
                key: ValueKey('AboutPage'),
                child: AboutPage()
            )
          else if(pathName == 'homePage')
            MaterialPage(
                key: ValueKey('HomePage'),
                child: HomePage(onTapped: _handleOnTap,)
            )
          else if(pathName == 'productsPage')
              MaterialPage(
                  key: ValueKey('ProductsPage'),
                  child: ProductsPage(onProductSelected: _handleOnProductSelection,)
              )

      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (pathName == 'aboutPage') {
          pathName = 'homePage';
          notifyListeners();
        }else if (pathName == 'productsPage') {
          pathName = 'homePage';
          notifyListeners();
        }else if (pathName == 'productPage') {
          pathName = 'productsPage';
          selectedItemId = null;
          notifyListeners();
        }
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  void _handleOnTap(String path) {
    pathName = path;
    notifyListeners();
  }

  void _handleOnProductSelection(String path, int id) {
    pathName = path;
    selectedItemId = id.toString();
    notifyListeners();
  }
}