import 'package:cloud_functions/cloud_functions.dart';
import 'package:pets_life/constants/enviroment_variables.dart';

class FirebaseFunctionService {
  static final FirebaseFunctionService instance = FirebaseFunctionService._();
  static const List<String> _implementedMethods = ["fruitsList"];

  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final _callables = Map<String, HttpsCallable>();

  FirebaseFunctionService._() {
    if (ENVIRONMENT == "development") {
      this._functions.useFunctionsEmulator(origin: "http://localhost:5001");
    }
  }

  Future<T> call<T>(String name, [dynamic parameters]) async {
    if (!_implementedMethods.contains(name)) {
      throw 'Function name should be one of $_implementedMethods';
    }

    dynamic callable = this._callables[name];
    if (callable == null) {
      this._callables[name] = callable = this._functions.httpsCallable(name);
    }

    dynamic results;
    if (parameters is Map<String, dynamic>) {
      results = await callable.call<T>(parameters);
    } else {
      results = await callable.call<T>();
    }

    return results.data;
  }
}
