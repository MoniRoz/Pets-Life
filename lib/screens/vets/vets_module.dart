import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/screens/vets/vets.dart';

class VetsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => VetsScreen(),
        ),
      ];
}
