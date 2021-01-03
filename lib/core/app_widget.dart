import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/screens/not_found/not_found.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AUTH_ROUTE,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: (setting) {
        final generatedRoute = Modular.generateRoute(setting);
        if (generatedRoute != null) return generatedRoute;
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
      },
    );
  }
}
