import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:pets_life/screens/parks/shared_components/photo.dart';
import 'package:pets_life/widgets/drawer/drawer.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of parks"),
      ),
      drawer: AppDrawer(),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index.isOdd ? 5 : 0,
              top: index / 2 < 1 ? 0 : 5,
            ),
            child: GestureDetector(
              child: Photo(),
              onTap: () {
                Modular.to.pushNamed('$index');
              },
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
