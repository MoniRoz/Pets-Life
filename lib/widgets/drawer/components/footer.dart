import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets_life/widgets/drawer/components/nav_list_tile.dart';

import 'section_header.dart';

final footerSection = <Widget>[
  SectionHeader(title: "Contact"),
  NavListTile(
    title: "Contact us",
    icon: Icons.contact_mail_outlined,
    route: "",
  ),
  ListTile(
    title: Text('Sign Out'),
    leading: Icon(Icons.logout),
    onTap: FirebaseAuth.instance.signOut,
  )
];
