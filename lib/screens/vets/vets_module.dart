import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/screens/vets/detials/vet_detail_screen.dart';
import 'package:pets_life/screens/vets/overview/vets_list_screen.dart';

class VetsModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => VetsOverviewScreen(),
        ),
        ChildRoute(
          "/:id",
          child: (context, args) => VetDetailScreen(id: args.params['id']),
        )
      ];
}
