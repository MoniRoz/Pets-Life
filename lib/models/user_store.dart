import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore() {
    FirebaseAuth.instance.authStateChanges().listen((User currentUser) {
      user = currentUser;
    });
  }

  @observable
  User user;
}
