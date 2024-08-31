class MyRoutePaths {
  final String? id;
  final bool isUnknown;
  final String pathName;

  MyRoutePaths.home()
    : id = null, isUnknown = false, pathName = 'homePage';
  MyRoutePaths.about()
      : id = null, isUnknown = false, pathName = 'aboutPage';
  MyRoutePaths.products()
      : id = null, isUnknown = false, pathName = 'productsPage';
  MyRoutePaths.product(this.id)
    : isUnknown = false, pathName = 'productPage';

  MyRoutePaths.unknown()
    : id = null, isUnknown = true, pathName = 'unknownPage';
}

