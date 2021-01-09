import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:pets_life/constants/assets_paths.dart';
import 'package:pets_life/screens/vets/components/avatar.dart';

class VetDetailScreen extends StatelessWidget {
  final String id;
  const VetDetailScreen({@required this.id, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detials"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: size.width,
              minHeight: size.height - (paddingTop + kToolbarHeight),
            ),
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    top: -90,
                    child: Avatar(
                      path: '$VECTORS_PATH/avatar_$id.svg',
                      size: 180,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(
                          //TODO get from avtar size and padding - change SIZE,
                          Size(size.width - 180 - 30, 90),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Text(
                              "name and surname".toUpperCase(),
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .fontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Specialization",
                              style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .fontSize,
                              ),
                            ),
                            SizedBox(height: 5),
                            SmoothStarRating(
                              allowHalfRating: true,
                              borderColor: Colors.amber,
                              color: Colors.amber,
                              isReadOnly: true,
                              rating: 3.5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
