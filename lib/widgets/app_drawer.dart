import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          if (_userStore.isUser) ...[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Welcome, ${_userStore.currentUser.email}'),
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ],
      ),
    );
  }
}
