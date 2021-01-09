import 'package:flutter/material.dart';

import 'package:pets_life/constants/assets_paths.dart';
import 'package:pets_life/screens/vets/shared_components/photo.dart';
import 'package:pets_life/widgets/scrollable_card_layout.dart';

import 'components/primary_info.dart';
import 'components/secondary_info.dart';

class DetailsScreen extends StatelessWidget {
  final String id;
  static const double _avatarRadius = 100.0;

  const DetailsScreen({@required this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detials"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ScrollableCardLayout(
        gapScreenPercentage: 0.20,
        primaryChildHeight: _avatarRadius * 2,
        primaryWidget: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Container()),
                  Flexible(child: PrimaryInfo()),
                ],
              ),
            ),
            Photo(
              path: '$VECTORS_PATH/avatar_$id.svg',
              radius: _avatarRadius,
            ),
          ],
        ),
        secondaryWidget: Padding(
          padding: EdgeInsets.only(top: 15),
          child: SecondaryInfo(),
        ),
      ),
    );
  }
}
