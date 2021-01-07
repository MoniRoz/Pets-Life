import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;

  LoadingScreen({@required this.child});

  Future<Widget> initalize() async {
    await Future.wait([
      Firebase.initializeApp(),
      Future.delayed(const Duration(seconds: 3)),
    ]);

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: initalize(),
      builder: (_, snapshot) {
        if (snapshot.hasData) return snapshot.data;

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: snapshot.hasError
                ? Text("An error occured")
                : CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
