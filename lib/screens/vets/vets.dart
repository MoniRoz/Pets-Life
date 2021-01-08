import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:pets_life/constants/assets_paths.dart';
import 'package:pets_life/widgets/drawer/drawer.dart';

class VetsScreen extends StatelessWidget {
  const VetsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of vets'),
      ),
      drawer: AppDrawer(),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(10, (index) {
          final colorValue = (math.Random().nextDouble() * 0xFFFFFF).toInt();

          return ClipOval(
            child: Container(
              color: Color(colorValue).withOpacity(1.0),
              child: SvgPicture.asset('$VECTORS_PATH/avatar_${++index}.svg'),
            ),
          );
        }),
      ),
    );
  }
}
