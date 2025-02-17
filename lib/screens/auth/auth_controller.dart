import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart' show LoginData;

class AuthController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> loginUser(LoginData data) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return 'Oops something whent wrong!';
    }

    return Future.value(null);
  }

  Future<String> registerUser(LoginData data) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return 'Oops something whent wrong!';
    }

    return Future.value(null);
  }

  Future<String> recoverPassword(String name) {
    return Future.value(null);
  }
}
