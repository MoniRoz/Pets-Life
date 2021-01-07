import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Future<void> initialize() {
    user = ObservableStream(FirebaseAuth.instance.authStateChanges());
    return Future.value();
  }

  @observable
  ObservableStream<User> user;

  @computed
  User get currentUser => this.user?.value ?? FirebaseAuth.instance.currentUser;

  @computed
  bool get isUser => this.currentUser != null;
}
