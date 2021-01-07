import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/screens/auth/auth_screen.dart';
import 'package:pets_life/utils/route_guards/user_in_app_guard.dart';

import 'auth_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((_) => AuthController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => AuthScreen(),
          guards: [
            UserInAppGuard(
              allowAccessForUser: UserInAppGuardedType.signOut,
              onGuardAccessDenideRoute: HOME_ROUTE,
            ),
          ],
        ),
      ];
}
