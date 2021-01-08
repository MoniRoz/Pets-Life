import 'package:flutter/material.dart';

import 'section_header.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Manage account"),
        ListTile(
          title: Text("General"),
          leading: Icon(Icons.settings),
          onTap: () => {},
        ),
        ListTile(
          title: Text("Friends"),
          leading: Icon(Icons.people),
          onTap: () => {},
        ),
      ],
    );
  }
}
