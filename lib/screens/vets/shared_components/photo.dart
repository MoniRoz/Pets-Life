import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Photo extends StatelessWidget {
  final String path;
  final double radius;

  Photo({@required this.path, this.radius = 50});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Hero(
        tag: path,
        child: Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: ClipOval(child: SvgPicture.asset(path)),
        ),
      ),
    );
  }
}
