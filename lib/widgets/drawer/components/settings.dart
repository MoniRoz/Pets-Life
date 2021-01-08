import 'package:flutter/material.dart';

import 'package:pets_life/widgets/drawer/components/nav_list_tile.dart';

import 'section_header.dart';

final settingsSection = <Widget>[
  SectionHeader(title: "Manage account"),
  NavListTile(
    title: "General",
    icon: Icons.settings,
    route: "",
  ),
  NavListTile(
    title: "Friends",
    icon: Icons.people,
    route: "",
  ),
];
