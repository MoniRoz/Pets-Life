import 'package:flutter/material.dart';
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
      body: Center(
        child: Text("Hello from vets list"),
      ),
    );
  }
}
