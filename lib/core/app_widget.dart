import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/stores/user_store.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key key}) : super(key: key);
  final UserStore _userStore = Modular.get<UserStore>();

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ReactionDisposer _disposer;
  @override
  void initState() {
    super.initState();
    _disposer = reaction(
      (_) => widget._userStore.isUser,
      (isUser) {
        if (!isUser) Modular.to.pushReplacementNamed(AUTH_ROUTE);
      },
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: HOME_ROUTE,
    ).modular();
  }
}
