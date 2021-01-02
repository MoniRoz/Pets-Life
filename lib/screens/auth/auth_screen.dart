import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_controller.dart';

class AuthScreen extends StatelessWidget {
  final _controller = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Pets Life',
      logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _controller.loginUser,
      onSignup: _controller.registerUser,
      onRecoverPassword: _controller.recoverPassword,
      onSubmitAnimationCompleted: () => {},
    );
  }
}
