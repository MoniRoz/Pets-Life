import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavListTile extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;

  NavListTile({
    @required this.title,
    @required this.route,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = route == ModalRoute.of(context).settings.name;

    return ListTile(
      title: Text(title),
      selected: isActive,
      selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.2),
      leading: Icon(icon),
      onTap: () {
        if (!isActive) {
          Modular.to
            ..pop()
            ..pushNamed(route);
        }
        ;
      },
    );
  }
}
