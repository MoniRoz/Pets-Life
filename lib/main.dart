import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(
        typography: Typography.material2018(platform: defaultTargetPlatform),
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Firebase Example'),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text('An error occured');
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                'Firebase Loaded',
                style: Theme.of(context).textTheme.bodyText1,
              );
            }

            return CircularProgressIndicator(strokeWidth: 8);
          },
        ),
      ),
    );
  }
}
