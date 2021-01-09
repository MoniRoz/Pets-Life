import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pets_life/constants/assets_paths.dart';

import 'package:pets_life/stores/user_store.dart';

class Header extends StatelessWidget {
  final UserStore _userStore = Modular.get<UserStore>();

  Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundImage:
                Image.asset('$IMAGES_PATH/sample_avatar.png').image,
          ),
          SizedBox(height: 5),
          Text(
            '${_userStore.fullName}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 5),
          Text('${_userStore.user?.email ?? ""}')
        ],
      ),
    );
  }
}
