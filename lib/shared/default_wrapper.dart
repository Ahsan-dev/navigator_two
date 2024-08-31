import 'package:flutter/material.dart';

class DefaultWrapper extends StatelessWidget {
  const DefaultWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: child,
    );
  }
}
