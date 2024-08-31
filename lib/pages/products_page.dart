import 'package:flutter/material.dart';

import '../shared/default_wrapper.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    required this.onProductSelected,
  });

  final Function onProductSelected;

  @override
  Widget build(BuildContext context) {
    return DefaultWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Here are our products:'),
              TextButton(
                  onPressed: (){
                    onProductSelected('productPage', 1);
                  },
                  child: Text('Product 1')
              ),
              TextButton(
                  onPressed: (){
                    onProductSelected('productPage', 2);
                  },
                  child: Text('Product 2')
              ),
              TextButton(
                  onPressed: (){
                    onProductSelected('productPage', 3);
                  },
                  child: Text('Product 3')
              )
            ],
          ),
        )
    );;
  }
}
