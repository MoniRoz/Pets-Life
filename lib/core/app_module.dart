import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/core/components/loading_screen.dart';
import 'package:pets_life/screens/home/home_module.dart';
import 'package:pets_life/stores/user_store.dart';
import 'package:pets_life/screens/auth/auth_module.dart';
import 'package:pets_life/screens/not_found/not_found.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind.singleton((_) => UserStore())];

  @override
  Widget get bootstrap => LoadingScreen();

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AUTH_ROUTE,
          module: AuthModule(),
        ),
        ModuleRoute(
          HOME_ROUTE,
          module: HomeModule(),
        ),
        ChildRoute(
          '**',
          child: (_, __) => NotFoundScreen(),
        ),
      ];
}
