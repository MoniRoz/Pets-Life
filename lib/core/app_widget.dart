import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  final Future<FirebaseApp> _firebaseInit = Firebase.initializeApp();

  final String _title = 'Flutter Firebase';
  final ThemeData _themeData = ThemeData(primarySwatch: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInit,
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            title: _title,
            theme: _themeData,
            home: CircularProgressIndicator(strokeWidth: 8),
          );
        }

        if (snapshot.hasError) {
          return MaterialApp(
            title: _title,
            theme: _themeData,
            home: Text("An error occured"),
          );
        }

        return MaterialApp(
          title: _title,
          theme: _themeData,
          initialRoute: "/auth",
          onGenerateRoute: Modular.generateRoute,
          navigatorKey: Modular.navigatorKey,
        );
      },
    );
  }
}
