import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<void> setPersistence(Persistence persistence) {
    return auth.setPersistence(persistence);
  }
}
