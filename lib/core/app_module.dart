import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/core/app_widget.dart';
import 'package:pets_life/stores/user_store.dart';
import 'package:pets_life/screens/auth/auth_module.dart';
import 'package:pets_life/screens/home/home.dart';
import 'package:pets_life/screens/not_found/not_found.dart';
import 'package:pets_life/utils/route_guards/user_in_app_guard.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [Bind.lazySingleton((_) => UserStore())];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AUTH_ROUTE,
          module: AuthModule(),
          guards: [
            UserInAppGuard(allowAccessForUser: UserInAppGuardedType.signOut),
          ],
        ),
        ChildRoute(
          HOME_ROUTE,
          child: (_, __) => HomeScreen(),
        ),
        ChildRoute(
          '**',
          child: (_, __) => NotFoundScreen(),
        ),
      ];
}
