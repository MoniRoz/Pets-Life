import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/screens/auth/auth_screen.dart';

import 'auth_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((_) => AuthController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => AuthScreen(),
        ),
      ];
}
