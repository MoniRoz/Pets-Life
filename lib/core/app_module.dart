import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/core/components/loading_screen.dart';
import 'package:pets_life/screens/home/home_module.dart';
import 'package:pets_life/stores/user_store.dart';
import 'package:pets_life/screens/auth/auth_module.dart';
import 'package:pets_life/screens/not_found/not_found.dart';
import 'package:pets_life/utils/route_guards/user_in_app_guard.dart';

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
          guards: [
            UserInAppGuard(
              allowAccessForUser: UserInAppGuardedType.signOut,
              onGuardAccessDenideRoute: HOME_ROUTE,
            ),
          ],
        ),
        ModuleRoute(
          HOME_ROUTE,
          module: HomeModule(),
          guards: [
            UserInAppGuard(
              allowAccessForUser: UserInAppGuardedType.signIn,
              onGuardAccessDenideRoute: AUTH_ROUTE,
            ),
          ],
        ),
        ChildRoute(
          '**',
          child: (_, __) => NotFoundScreen(),
        ),
      ];
}
