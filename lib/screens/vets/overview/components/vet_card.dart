import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/constants/assets_paths.dart';
import 'package:pets_life/screens/vets/shared_components/photo.dart';

class VetCard extends StatelessWidget {
  final int _position;
  VetCard(this._position, {Key key}) : super(key: key);

  void openVetDetails() {
    Modular.to.pushNamed('$_position');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: openVetDetails,
        horizontalTitleGap: 25,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 7),
        title: Text("Name and surname"),
        subtitle: Text("Specialization"),
        leading: Photo(
          radius: 23,
          path: '$VECTORS_PATH/avatar_$_position.svg',
        ),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
