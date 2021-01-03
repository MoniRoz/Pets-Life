import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HOME_ROUTE,
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
