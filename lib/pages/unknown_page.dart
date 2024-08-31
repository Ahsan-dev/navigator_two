import 'package:flutter/material.dart';

import '../shared/default_wrapper.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultWrapper(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Unknown Page...')
            ],
          ),
        )
    );
  }
}
