// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<User> _$currentUserComputed;

  @override
  User get currentUser =>
      (_$currentUserComputed ??= Computed<User>(() => super.currentUser,
              name: '_UserStore.currentUser'))
          .value;
  Computed<String> _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_UserStore.fullName'))
      .value;

  final _$userAtom = Atom(name: '_UserStore.user');

  @override
  ObservableStream<User> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableStream<User> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  @override
  String toString() {
    return '''
user: ${user},
currentUser: ${currentUser},
fullName: ${fullName}
    ''';
  }
}
