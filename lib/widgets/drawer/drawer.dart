import 'package:flutter/material.dart';
import 'package:pets_life/widgets/drawer/components/footer.dart';

import 'components/header.dart';
import 'components/body.dart';
import 'components/settings.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Header(),
          ...settingsSection,
          Divider(),
          ...exploreAppSection,
          Divider(),
          ...footerSection,
        ],
      ),
    );
  }
}
