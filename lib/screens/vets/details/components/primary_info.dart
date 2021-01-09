import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PrimaryInfo extends StatelessWidget {
  const PrimaryInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(height: 10),
        Text(
          "name and surname".toUpperCase(),
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Specialization",
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
          ),
        ),
        SmoothStarRating(
          allowHalfRating: true,
          borderColor: Colors.amber,
          color: Colors.amber,
          isReadOnly: true,
          rating: 3.5,
        ),
      ],
    );
  }
}
