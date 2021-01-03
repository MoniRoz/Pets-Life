import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/screens/auth/auth_module.dart';
import 'package:pets_life/screens/home/home.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  static Inject get to => Inject<AppModule>.of();

  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(AUTH_ROUTE, module: AuthModule()),
        if (true) ...[
          ModularRouter(
            HOME_ROUTE,
            child: (_, __) => HomeScreen(),
          )
        ]
      ];
}
