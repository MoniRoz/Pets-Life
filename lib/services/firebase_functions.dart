import 'package:cloud_functions/cloud_functions.dart';
import 'package:pets_life/constants/enviroment_variables.dart';

class FirebaseFunctionService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  static final FirebaseFunctionService instance =
      FirebaseFunctionService._internal();

  FirebaseFunctionService._internal() {
    if (EnviromentVariables.ENVIRONMENT == "development") {
      _functions.useFunctionsEmulator(origin: "http://localhost:5001");
    }
  }

  Future<List<dynamic>> getFruits() async {
    final results = await this._functions.httpsCallable("fruitsList").call();
    return results.data;
  }
}
