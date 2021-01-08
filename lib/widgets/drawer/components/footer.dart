import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'section_header.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Contact"),
        ListTile(
          title: Text("Contact us"),
          leading: Icon(Icons.contact_mail_outlined),
          onTap: () => {},
        ),
        ListTile(
          title: Text('Sign Out'),
          leading: Icon(Icons.logout),
          onTap: FirebaseAuth.instance.signOut,
        )
      ],
    );
  }
}
