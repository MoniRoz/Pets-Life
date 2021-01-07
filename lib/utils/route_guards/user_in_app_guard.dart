import 'package:flutter/foundation.dart' show required;
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/stores/user_store.dart';

enum UserInAppGuardedType {
  signIn,
  signOut,
}

class UserInAppGuard implements RouteGuard {
  final String onGuardAccessDenideRoute;
  final UserInAppGuardedType allowAccessForUser;
  final UserStore _userStore = Modular.get<UserStore>();

  UserInAppGuard({
    @required this.allowAccessForUser,
    @required this.onGuardAccessDenideRoute,
  });

  @override
  Future<bool> canActivate(String url, ModularRoute router) {
    if (_userStore.isUser &&
        allowAccessForUser == UserInAppGuardedType.signIn) {
      return Future.value(true);
    }

    if (!_userStore.isUser &&
        allowAccessForUser == UserInAppGuardedType.signOut) {
      return Future.value(true);
    }

    return Future.delayed(Duration(milliseconds: 1)).then((value) {
      Modular.to.pushReplacementNamed(this.onGuardAccessDenideRoute);
      return true;
    });
  }
}
