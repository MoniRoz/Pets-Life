import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pets_life/core/app_widget.dart';

class CustomSplashScreen extends StatelessWidget {
  Future<Widget> initalize() async {
    await Future.wait([
      Firebase.initializeApp(),
      Future.delayed(const Duration(seconds: 3)),
    ]);
    return AppWidget();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: initalize(),
      builder: (_, snapshot) {
        if (snapshot.hasData) return snapshot.data;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Expanded(
            child: Center(
              child: snapshot.hasError
                  ? Text("An error occured")
                  : CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
