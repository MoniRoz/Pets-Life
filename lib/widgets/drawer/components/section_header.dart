import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  SectionHeader({@required this.title, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      enabled: false,
    );
  }
}
