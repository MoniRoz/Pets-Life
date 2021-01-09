import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  Future<void> initialize() {
    userStream = ObservableStream(FirebaseAuth.instance.authStateChanges());
    return Future.value();
  }

  @observable
  ObservableStream<User> userStream;

  @computed
  User get user => this.userStream?.value ?? FirebaseAuth.instance.currentUser;

  @computed
  String get fullName =>
      this.user?.displayName != null && this.user.displayName.length > 0
          ? this.user.displayName
          : 'Gall Anonim';
}
