import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';
import 'package:pets_life/utils/route_guards/user_in_app_guard.dart';

import 'details/details_screen.dart';
import 'overview/overview_screen.dart';

class ParksModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => OverviewScreen(),
          guards: [
            UserInAppGuard(
              allowAccessForUser: UserInAppGuardedType.signIn,
              onGuardAccessDenideRoute: AUTH_ROUTE,
            ),
          ],
        ),
        ChildRoute(
          "/:id",
          child: (context, args) => DetailsScreen(id: args.params['id']),
        )
      ];
}
