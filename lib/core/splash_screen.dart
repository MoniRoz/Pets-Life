import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/assets_paths.dart' show IMAGES_PATH;
import 'package:pets_life/core/app_module.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatelessWidget {
  Future<Widget> loadFromFuture() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(const Duration(seconds: 4));
      return ModularApp(module: AppModule());
    } catch (_) {
      return Text("An error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        navigateAfterFuture: loadFromFuture(),
        title: new Text(
          'Welcome In SplashScreen',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset('$IMAGES_PATH/ecorp-lightblue.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red,
      ),
    );
  }
}
