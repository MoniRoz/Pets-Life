import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/routes.dart';

import 'section_header.dart';

class _NavigateToRouteListTile extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;

  _NavigateToRouteListTile({
    @required this.title,
    @required this.route,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context).settings.name;

    return ListTile(
      title: Text(title),
      selected: currentRoute == route,
      selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.2),
      leading: Icon(icon),
      onTap: () {
        if (currentRoute != route) Modular.to.pushNamed(route);
      },
    );
  }
}

class Naviagtion extends StatelessWidget {
  const Naviagtion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: "Explore"),
        _NavigateToRouteListTile(
          title: "Home",
          route: HOME_ROUTE,
          icon: Icons.home,
        ),
        _NavigateToRouteListTile(
          title: "Playgrounds",
          route: "",
          icon: Icons.pets,
        ),
        _NavigateToRouteListTile(
          title: "Vets",
          route: "",
          icon: Icons.local_hospital,
        )
      ],
    );
  }
}
