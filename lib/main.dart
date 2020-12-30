import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = 'Flutter Firebase Example';
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        typography: Typography.material2018(platform: defaultTargetPlatform),
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('An error occured');
            if (snapshot.connectionState == ConnectionState.done) {
              return Home();
            }

            return CircularProgressIndicator(strokeWidth: 8);
          },
        ),
      ),
    );
  }
}
