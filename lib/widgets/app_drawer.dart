import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart' show AUTH_ROUTE;
import 'package:pets_life/stores/user_store.dart';

class AppDrawer extends StatelessWidget {
  final UserStore _userStore = Modular.get<UserStore>();

  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Observer(
              builder: (_) {
                if (!_userStore.isUser) return Text('Drawer Header');
                return Text('Welcome, ${_userStore.currentUser.email}');
              },
            ),
          ),
          Observer(
            builder: (_) {
              if (_userStore.isUser) {
                return ListTile(
                  title: Text('Sign Out'),
                  onTap: () {
                    Modular.to.pop();
                    FirebaseAuth.instance.signOut();
                  },
                );
              }

              return ListTile(
                title: Text('Login/Register'),
                onTap: () {
                  Modular.to.pushNamed(AUTH_ROUTE);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
