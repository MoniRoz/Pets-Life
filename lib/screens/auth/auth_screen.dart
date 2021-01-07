import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/assets_paths.dart' show IMAGES_PATH;
import 'package:pets_life/constants/routes.dart';

import 'auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final _controller = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'Pets Life',
        logo: '$IMAGES_PATH/ecorp-lightblue.png',
        onLogin: _controller.loginUser,
        onSignup: _controller.registerUser,
        onRecoverPassword: _controller.recoverPassword,
        onSubmitAnimationCompleted: () {
          Modular.to.pushReplacementNamed(HOME_ROUTE);
        });
  }
}
