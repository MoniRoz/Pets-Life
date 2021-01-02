import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/screens/auth/auth_screen.dart';

import 'auth_controller.dart';

class AuthModule extends ChildModule {
  static Inject get to => Inject<AuthModule>.of();

  @override
  List<Bind> get binds => [Bind((_) => AuthController())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => AuthScreen()),
      ];
}
