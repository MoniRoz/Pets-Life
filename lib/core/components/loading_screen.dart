import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/core/app_widget.dart';
import 'package:pets_life/stores/user_store.dart';

class LoadingScreen extends StatelessWidget {
  Future<Widget> initalize() async {
    await Future.wait([
      Firebase.initializeApp().then(
        (_) async {
          await Modular.get<UserStore>().initialize();
        },
      ),
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
