import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';

import 'components/loading_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
      child: MaterialApp(
        title: 'Flutter Firebase',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: HOME_ROUTE,
      ).modular(),
    );
  }
}
