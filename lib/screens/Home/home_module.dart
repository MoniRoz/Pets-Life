import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/screens/home/home.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => HomeScreen(),
        ),
      ];
}
