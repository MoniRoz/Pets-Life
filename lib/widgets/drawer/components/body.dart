import 'package:flutter/material.dart';

import 'package:pets_life/constants/routes.dart';

import 'nav_list_tile.dart';
import 'section_header.dart';

final exploreAppSection = <Widget>[
  SectionHeader(title: "Explore"),
  NavListTile(
    title: "Home",
    route: HOME_ROUTE,
    icon: Icons.home,
  ),
  NavListTile(
    title: "Parks",
    route: PARKS_ROUTE,
    icon: Icons.park,
  ),
  NavListTile(
    title: "Vets",
    route: VETS_ROUTE,
    icon: Icons.local_hospital,
  )
];
