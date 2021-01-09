// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<User> _$userComputed;

  @override
  User get user => (_$userComputed ??=
          Computed<User>(() => super.user, name: '_UserStore.user'))
      .value;
  Computed<String> _$fullNameComputed;

  @override
  String get fullName => (_$fullNameComputed ??=
          Computed<String>(() => super.fullName, name: '_UserStore.fullName'))
      .value;

  final _$userStreamAtom = Atom(name: '_UserStore.userStream');

  @override
  ObservableStream<User> get userStream {
    _$userStreamAtom.reportRead();
    return super.userStream;
  }

  @override
  set userStream(ObservableStream<User> value) {
    _$userStreamAtom.reportWrite(value, super.userStream, () {
      super.userStream = value;
    });
  }

  @override
  String toString() {
    return '''
userStream: ${userStream},
user: ${user},
fullName: ${fullName}
    ''';
  }
}
