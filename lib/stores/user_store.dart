import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:pets_life/services/firebase_auth.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore() {
    user = ObservableStream(FirebaseAuthService.auth.authStateChanges());
  }

  @observable
  ObservableStream<User> user;

  @computed
  User get currentUser => this.user?.value;

  @computed
  bool get isUser => this.currentUser != null;
}
