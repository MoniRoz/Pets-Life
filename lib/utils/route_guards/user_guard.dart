import 'package:flutter/foundation.dart' show required;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/routes.dart' show HOME_ROUTE;

import 'package:pets_life/models/user_store.dart';

enum UserGuardedType {
  signIn,
  signOut,
}

class UserGuard implements RouteGuard {
  final UserStore _store = Modular.get<UserStore>();
  final UserGuardedType allowAccessForUser;
  final String onGuardAccessDenideRoute;

  UserGuard({
    @required this.allowAccessForUser,
    this.onGuardAccessDenideRoute = HOME_ROUTE,
  });

  @override
  Future<bool> canActivate(String url, ModularRoute router) {
    if (allowAccessForUser == UserGuardedType.signOut && _store.user == null) {
      return Future.value(true);
    }
    if (allowAccessForUser == UserGuardedType.signIn && _store.user != null) {
      return Future.value(true);
    }

    return Future.delayed(Duration(milliseconds: 1)).then((value) {
      Modular.to.pushReplacementNamed(this.onGuardAccessDenideRoute);
      return true;
    });
  }
}
