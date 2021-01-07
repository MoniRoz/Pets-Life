import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/screens/home/home.dart';
import 'package:pets_life/utils/route_guards/user_in_app_guard.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => HomeScreen(),
          guards: [
            UserInAppGuard(
              allowAccessForUser: UserInAppGuardedType.signIn,
              onGuardAccessDenideRoute: AUTH_ROUTE,
            ),
          ],
        ),
      ];
}
