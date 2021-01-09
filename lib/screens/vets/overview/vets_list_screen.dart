import 'package:flutter/material.dart';

import 'package:pets_life/screens/vets/overview/components/vet_card.dart';
import 'package:pets_life/widgets/drawer/drawer.dart';

class VetsOverviewScreen extends StatelessWidget {
  const VetsOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of vets'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) => VetCard(index + 1),
      ),
    );
  }
}
