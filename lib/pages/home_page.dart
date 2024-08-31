import 'package:flutter/material.dart';
import 'package:navigator_two/shared/default_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.onTapped,
  });

  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return DefaultWrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
            TextButton(
                onPressed: (){
                  onTapped('productsPage');
                },
                child: Text('Go to products page')
            ),
            TextButton(
                onPressed: (){
                  onTapped('aboutPage');
                },
                child: Text('About Us')
            )
          ],
        ),
      )
    );
  }
}
