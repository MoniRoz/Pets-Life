import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart' show LoginData;

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> loginUser(LoginData data) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return 'Oops something whent wrong!';
    }

    return null;
  }

  Future<String> registerUser(LoginData data) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (_) {
      return 'Oops something whent wrong!';
    }

    return null;
  }

  Future<String> recoverPassword(String name) {
    return null;
  }
}
