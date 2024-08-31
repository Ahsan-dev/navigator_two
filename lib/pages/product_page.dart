import 'package:flutter/material.dart';

import '../shared/default_wrapper.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.pid,
  });

  final pid;

  @override
  Widget build(BuildContext context) {
    return DefaultWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Product Page'),
              Text('Product $pid'),
            ],
          ),
        )
    );;
  }
}
