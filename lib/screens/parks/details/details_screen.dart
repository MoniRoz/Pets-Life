import 'package:flutter/material.dart';

import 'package:pets_life/screens/parks/shared_components/photo.dart';

import 'components/secondary_info.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({@required this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // Add the app bar and list of items as slivers in the next steps.
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Photo(),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, __) => Center(
                child: SecondaryInfo(),
              ),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
