import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Center(
        child: Text(
          "Page not found".toUpperCase(),
          textScaleFactor: 3.0,
        ),
      ),
    );
  }
}
