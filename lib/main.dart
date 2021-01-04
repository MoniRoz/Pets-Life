import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'configure_nonweb.dart' if (dart.library.html) 'configure_web.dart';

import 'core/app_module.dart';

void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module: AppModule()));
}
