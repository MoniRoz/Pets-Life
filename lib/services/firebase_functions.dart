import 'package:cloud_functions/cloud_functions.dart';
import 'package:pets_life/constants/enviroment_variables.dart';

class FirebaseFunctionService {
  static final FirebaseFunctionService instance = FirebaseFunctionService._();
  static const List<String> _implementedMethods = ["fruitsList"];

  FirebaseFunctions _functions;
  final _callables = Map<String, HttpsCallable>();

  FirebaseFunctionService._() {
    this._functions = FirebaseFunctions.instance;
    if (EnviromentVariables.ENVIRONMENT == "development") {
      this._functions.useFunctionsEmulator(origin: "http://localhost:5001");
    }
  }

  Future<T> call<T>(String name, [Map<String, dynamic> parameters]) async {
    if (!_implementedMethods.contains(name)) {
      throw 'Function name should be one of $_implementedMethods';
    }

    HttpsCallable callable = this._callables[name];
    if (callable == null) {
      this._callables[name] = callable = this._functions.httpsCallable(name);
    }

    final results = await callable.call<T>(parameters);
    return results.data;
  }
}
