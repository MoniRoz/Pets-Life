import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'core/app_module.dart';

void main() async {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule()));
}
